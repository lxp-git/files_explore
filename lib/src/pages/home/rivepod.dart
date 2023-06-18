import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:files_explore/src/dto/android_application.dart';
import 'package:files_explore/src/utils/constants.dart';
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
      String? filter}) = TreeNodeFileSystemEntity;
  @Implements<TreeNode>()
  factory TreeNodeModel.androidApplication(
      {required AndroidApplication androidApplication,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter}) = TreeNodeAndroidApplication;

  factory TreeNodeModel.fromJson(Map<String, Object?> json) =>
      _$TreeNodeModelFromJson(json);
}

@riverpod
class AsyncCurrentTreeNodeModel extends _$AsyncCurrentTreeNodeModel {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final TreeNodeModel? defaultState;
  AsyncCurrentTreeNodeModel({this.defaultState});

  @override
  Future<TreeNodeModel> build() async {
    if (defaultState == null) {
      await [Permission.storage, Permission.manageExternalStorage].request();
      final rootDirectory = await getExternalStorageDirectory();
      if (rootDirectory != null) {
        return TreeNodeModel.fileSystemEntity(children: [
          TreeNodeModel.fileSystemEntity(
              parent: null,
              children: [],
              fileSystemEntity: Directory(rootDirectory.path)),
          TreeNodeModel.androidApplication(
              parent: null,
              children: [],
              androidApplication: AndroidApplication(
                  label: "App manager",
                  packageName: "",
                  activities: [],
                  enabled: true)),
        ], parent: null, fileSystemEntity: Directory(""));
      }
      return TreeNodeModel.fileSystemEntity(
          parent: null, children: [], fileSystemEntity: Directory(""));
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
                0 - (treeNodeModel.children?.length ?? 0));
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
              androidApplication: treeNodeModel.androidApplication
                  .copyWith(activities: activities),
              expanded: TreeExpanded.ok);
        });
        listKey.currentState!.insertAllItems(
            treeNodeModel.children?.length ?? 0,
            state.value!.children?.length ??
                0 - (treeNodeModel.children?.length ?? 0));
      }
      return;
    }
    if (treeNodeModel is TreeNodeFileSystemEntity) {
      final directory = Directory(treeNodeModel.fileSystemEntity.path);
      directory.list().listen(
        (FileSystemEntity fileSystemEntity) async {
          print("fileSystemEntity:" + fileSystemEntity.toString());
          bool isDirectory = await FileSystemEntity.isDirectory(
              fileSystemEntity.absolute.path);
          state = AsyncValue.data(state.value!.copyWith(children: [
            ...?state.value!.children,
            TreeNodeModel.fileSystemEntity(
                parent: treeNodeModel, fileSystemEntity: fileSystemEntity)
          ], expanded: TreeExpanded.ok));
          listKey.currentState!
              .insertItem((state.value!.children?.length ?? 1) - 1);
        },
        onDone: () {},
      );
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
    }
  }

  init() async {}
}
