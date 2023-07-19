import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:files_explore/src/dto/android_application.dart';
import 'package:files_explore/src/dto/sftp_server.dart';
import 'package:files_explore/src/utils/constants.dart';
import 'package:files_explore/src/utils/local_storage_helper.dart';
import 'package:files_explore/src/utils/platform.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "rivepod.freezed.dart";
part "rivepod.g.dart";

sealed class TreeNode {
  // List<TreeNodeModel>? children;
  // TreeNodeModel? parent;
  // bool isExpanded = false;
}

class FileSystemEntityJSONConverter
    implements JsonConverter<FileSystemEntity, Map<String, dynamic>> {
  const FileSystemEntityJSONConverter();

  @override
  FileSystemEntity fromJson(Map<String, dynamic> json) {
    if (FileSystemEntity.isDirectorySync(json["path"])) {
      return Directory(json["path"]);
    }
    return File(json["path"]);
  }

  @override
  Map<String, dynamic> toJson(FileSystemEntity data) => {"path": data.path};
}

class SftpJSONConverter
    implements JsonConverter<SftpName, Map<String, dynamic>> {
  const SftpJSONConverter();

  @override
  SftpName fromJson(Map<String, dynamic> json) {
    return SftpName(
        filename: json["filename"],
        longname: json["longname"],
        attr: json["attr"]);
  }

  @override
  Map<String, dynamic> toJson(SftpName sftpName) => {
        "filename": sftpName.filename,
        "longname": sftpName.longname,
        "attr": sftpName.attr
      };
}

enum TreeExpanded { close, loading, ok }

@freezed
sealed class TreeNodeModel with _$TreeNodeModel {
  @Implements<TreeNode>()
  factory TreeNodeModel.fileSystemEntity(
      {@FileSystemEntityJSONConverter()
      required FileSystemEntity fileSystemEntity,
      List<TreeNodeModel>? children,
      TreeNodeModel? parent,
      TreeExpanded? expanded,
      String? filter,
      bool? selected}) = TreeNodeFileSystemEntity;
  @Implements<TreeNode>()
  factory TreeNodeModel.androidApplication(
      {required AndroidApplication androidApplication,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter}) = TreeNodeAndroidApplication;
  @Implements<TreeNode>()
  factory TreeNodeModel.androidActivity(
      {required AndroidActivity androidActivity,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter}) = TreeNodeAndroidActivity;
  @Implements<TreeNode>()
  factory TreeNodeModel.sftp(
      {@SftpJSONConverter() required SftpName sftpName,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter}) = TreeNodeSftpName;
  @Implements<TreeNode>()
  factory TreeNodeModel.sftpServer(
      {@SftpJSONConverter() required SftpServer sftpServer,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter}) = TreeNodeSftpServer;

  factory TreeNodeModel.fromJson(Map<String, Object?> json) =>
      _$TreeNodeModelFromJson(json);
}

@riverpod
class AsyncCurrentTreeNodeModel extends _$AsyncCurrentTreeNodeModel {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final TreeNodeModel? defaultState;
  SftpClient? sftpClient;
  AsyncCurrentTreeNodeModel({this.defaultState, this.sftpClient});

  @override
  Future<TreeNodeModel> build() async {
    if (defaultState == null) {
      await [Permission.storage, Permission.manageExternalStorage].request();
      final rootDirectory = await PlatformUtils.getExternalStorageDirectory();
      return TreeNodeModel.fileSystemEntity(children: [
        TreeNodeModel.fileSystemEntity(
            parent: null,
            children: [],
            fileSystemEntity: Directory(rootDirectory)),
        TreeNodeModel.androidApplication(
            parent: null,
            children: [],
            androidApplication: AndroidApplication(
                label: "App manager",
                packageName: "",
                activities: [],
                enabled: true)),
        TreeNodeModel.sftpServer(
            parent: null,
            children: [],
            sftpServer: SftpServer(label: "SFTP", host: "", username: "")),
      ], parent: null, fileSystemEntity: Directory(""));
    }
    return defaultState!;
  }

  list() async {
    final TreeNodeModel treeNodeModel = state.value!;
    if (treeNodeModel.expanded == TreeExpanded.ok) {
      state = AsyncValue.data(
          state.value!.copyWith(expanded: TreeExpanded.close, children: []));
      listKey.currentState?.removeAllItems(
        (context, animation) {
          return Container();
        },
      );
      return;
    }
    state =
        AsyncValue.data(state.value!.copyWith(expanded: TreeExpanded.loading));

    if (treeNodeModel is TreeNodeAndroidApplication) {
      if (treeNodeModel.androidApplication.packageName.isEmpty) {
        state = await AsyncValue.guard(() async {
          final applications = await PlatformUtils.getInstalledApplications();
          applications.sort((a, b) {
            if (a.enabled) {
              return 1;
            } else if (b.enabled) {
              return -1;
            }
            return 0;
          });
          return state.value!.copyWith(children: [
            ...?state.value!.children,
            ...applications
                .map((item) => TreeNodeModel.androidApplication(
                    androidApplication: item, parent: state.value))
                .toList()
          ], expanded: TreeExpanded.ok);
        });
        listKey.currentState!.insertAllItems(
            treeNodeModel.children?.length ?? 0,
            state.value!.children?.length ??
                0 - (treeNodeModel.children?.length ?? 0),
            duration: const Duration(milliseconds: 600),
            isAsync: true);
      } else {
        state = await AsyncValue.guard(() async {
          final activities = await PlatformUtils.getActivities(
              treeNodeModel.androidApplication.packageName);
          activities.sort((a, b) {
            if (a.enabled) {
              return 1;
            } else if (b.enabled) {
              return -1;
            }
            return 0;
          });
          return treeNodeModel.copyWith(
              children: activities
                  .map((e) => TreeNodeAndroidActivity(
                      androidActivity: e, parent: state.value))
                  .toList(),
              expanded: TreeExpanded.ok);
        });
        for (int i = 0;
            i <
                (state.value!.children?.length ??
                    0 - (treeNodeModel.children?.length ?? 0));
            i++) {
          listKey.currentState!
              .insertItem((treeNodeModel.children?.length ?? 0) + i);
        }

        // listKey.currentState!.insertAllItems(
        //     treeNodeModel.children?.length ?? 0,
        //     state.value!.children?.length ??
        //         0 - (treeNodeModel.children?.length ?? 0),
        //     isAsync: true);
      }
      return;
    } else if (treeNodeModel is TreeNodeFileSystemEntity) {
      final directory = Directory(treeNodeModel.fileSystemEntity.path);
      final fileSystemEntitys = directory.listSync();
      fileSystemEntitys.sort((a, b) {
        final aIsDir = FileSystemEntity.isDirectorySync(a.path);
        final bIsDir = FileSystemEntity.isDirectorySync(b.path);
        final aFileName =
            a.path.replaceFirst(treeNodeModel.fileSystemEntity.path, "");
        final bFileName =
            b.path.replaceFirst(treeNodeModel.fileSystemEntity.path, "");
        if (aIsDir && bIsDir) {
          return aFileName.compareTo(bFileName);
        } else if (aIsDir) {
          return -1;
        } else if (bIsDir) {
          return 1;
        } else {
          return aFileName.compareTo(bFileName);
        }
      });
      state = AsyncValue.data(state.value!.copyWith(
          children: fileSystemEntitys
              .map((e) => TreeNodeModel.fileSystemEntity(
                  parent: treeNodeModel, fileSystemEntity: e))
              .toList(),
          expanded: TreeExpanded.ok));
      final newDataCount = ((state.value!.children?.length ?? 1) -
          (treeNodeModel.children?.length ?? 0));
      listKey.currentState!
          .insertAllItems(treeNodeModel.children?.length ?? 0, newDataCount);
      // directory.list().listen(
      //   (FileSystemEntity fileSystemEntity) async {
      //     state = AsyncValue.data(state.value!.copyWith(children: [
      //       ...?state.value!.children,
      //       TreeNodeModel.fileSystemEntity(
      //           parent: treeNodeModel, fileSystemEntity: fileSystemEntity)
      //     ], expanded: TreeExpanded.ok));
      //     listKey.currentState!
      //         .insertItem((state.value!.children?.length ?? 1) - 1);
      //   },
      //   onDone: () {},
      // );
    } else if (treeNodeModel is TreeNodeSftpServer) {
      print("LocalStorageHelper.sftpServers:" +
          LocalStorageHelper.sftpServers.toString());
      if (treeNodeModel.sftpServer.host.isEmpty) {
        state = AsyncValue.data(treeNodeModel.copyWith(
            expanded: TreeExpanded.ok,
            children: LocalStorageHelper.sftpServers
                .map((e) =>
                    TreeNodeSftpServer(sftpServer: e, parent: state.value))
                .toList()));
        final newDataCount = ((state.value!.children?.length ?? 1) -
            (treeNodeModel.children?.length ?? 0));
        listKey.currentState!
            .insertAllItems(treeNodeModel.children?.length ?? 0, newDataCount);
      } else {
        state = await AsyncValue.guard(() async {
          final sshClient = SSHClient(
            await SSHSocket.connect(
                treeNodeModel.sftpServer.host, treeNodeModel.sftpServer.port),
            username: treeNodeModel.sftpServer.username,
            onPasswordRequest: () => treeNodeModel.sftpServer.password,
          );
          sftpClient = await sshClient.sftp();
          final files = await sftpClient!.listdir("/");
          return treeNodeModel.copyWith(
              children: files.map((sftpName) {
            return TreeNodeSftpName(sftpName: sftpName, parent: state.value);
          }).toList());
        });
        final newDataCount = ((state.value!.children?.length ?? 1) -
            (treeNodeModel.children?.length ?? 0));
        listKey.currentState!
            .insertAllItems(treeNodeModel.children?.length ?? 0, newDataCount);
      }
    } else if (treeNodeModel is TreeNodeSftpName) {
      state = await AsyncValue.guard(() async {
        String currentPath = "/" + treeNodeModel.sftpName.filename;
        TreeNodeModel? temp = treeNodeModel.parent;
        while (temp != null) {
          if (temp is TreeNodeSftpName) {
            currentPath = temp.sftpName.filename + "/" + currentPath;
          }
          temp = temp.parent;
        }
        final files = await sftpClient!.listdir(currentPath);
        return treeNodeModel.copyWith(
            children: files.map((sftpName) {
          return TreeNodeSftpName(sftpName: sftpName, parent: state.value);
        }).toList());
      });
      final newDataCount = ((state.value!.children?.length ?? 1) -
          (treeNodeModel.children?.length ?? 0));
      listKey.currentState!
          .insertAllItems(treeNodeModel.children?.length ?? 0, newDataCount);
    }
  }

  search(String text) {
    if (state.value! is TreeNodeAndroidApplication) {
      final oldValue = state.value;
      final oldList = oldValue?.children;
      state = AsyncValue.data(state.value!.copyWith(children: []));
      listKey.currentState!.removeAllItems(
        (context, animation) {
          return Container();
        },
      );
      final newState = oldValue!.copyWith(
          children: (oldList ?? []).where((element) {
        final found = (element as TreeNodeAndroidApplication)
            .androidApplication
            .label
            .contains(text);
        if (found) {
          print("found:" + element.androidApplication.label);
        }
        return found;
      }).toList());
      state = AsyncValue.data(newState);
      listKey.currentState!.insertAllItems(0, newState.children!.length);
    }
  }

  Future<bool> exec(String command) async {
    process?.kill();
    process = await Process.start('su', []);
    Completer<bool> completer = Completer();
    process?.stdout.transform(utf8.decoder).forEach((element) {
      print("=====================================================");
      print(element);
      if (element.contains("new state")) {
        completer.complete(true);
      }
    });
    process?.stdin.writeln(command);
    return completer.future;
  }

  Process? process;
  disableOrEnableIt() async {
    final node = state.value!;
    if (node is TreeNodeAndroidApplication) {
      state = await AsyncValue.guard(() async {
        await exec(
            'pm ${node.androidApplication.enabled ? "disable" : "enable"} ${node.androidApplication.packageName} --user 0');
        final application = await PlatformUtils.getApplicationInfo(
            node.androidApplication.packageName);
        return node.copyWith(androidApplication: application);
      });
    } else if (node is TreeNodeAndroidActivity) {
      state = await AsyncValue.guard(() async {
        await exec(
            'pm ${node.androidActivity.enabled ? "disable" : "enable"} ${(node.parent as TreeNodeAndroidApplication).androidApplication.packageName}/${node.androidActivity.name} --user 0');
        final androidActivity = await PlatformUtils.getActivityInfo(
            (node.parent as TreeNodeAndroidApplication)
                .androidApplication
                .packageName,
            node.androidActivity.name);
        return node.copyWith(androidActivity: androidActivity);
      });
    }
  }

  select() {
    TreeNodeModel treeNodeModel = state.value!;
    if (treeNodeModel is TreeNodeFileSystemEntity) {
      state = AsyncValue.data(treeNodeModel.copyWith(
          selected: treeNodeModel.selected == null
              ? true
              : !treeNodeModel.selected!));
    }
  }

  init() async {}

  insert({SftpServer? sftpServer}) {
    final node = state.value!;
    if (node is TreeNodeFileSystemEntity) {
      File(node.fileSystemEntity.path).deleteSync();
    } else if (node is TreeNodeSftpServer) {
      LocalStorageHelper.sftpServers = [
        ...LocalStorageHelper.sftpServers,
      ];
    }
  }

  delete() {
    final node = state.value!;
    if (node is TreeNodeFileSystemEntity) {
      File(node.fileSystemEntity.path).deleteSync();
    } else if (node is TreeNodeSftpServer) {
      LocalStorageHelper.sftpServers = LocalStorageHelper.sftpServers
          .where((element) => element.id != node.sftpServer.id)
          .toList();
    }
  }
}
