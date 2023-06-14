import 'dart:async';
import 'dart:io';

import 'package:files_explore/src/utils/constants.dart';
import 'package:files_explore/src/utils/platform.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "rivepod.freezed.dart";
part "rivepod.g.dart";

@freezed
class FileSystemEntityModel with _$FileSystemEntityModel {
  factory FileSystemEntityModel({
    required String path,
  }) = _FileSystemEntityModel;

  factory FileSystemEntityModel.fromJson(Map<String, Object?> json) =>
      _$FileSystemEntityModelFromJson(json);
}

@freezed
class TreeNodeModel with _$TreeNodeModel {
  factory TreeNodeModel(
      {required List<TreeNodeModel> children,
      required FileSystemEntityModel fileSystemEntityModel,
      required bool isExpanded,
      required TreeNodeModel? parent,
      required bool isDirectory}) = _TreeNodeModel;

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
        return TreeNodeModel(
            children: [
              TreeNodeModel(
                  parent: null,
                  children: [],
                  isExpanded: false,
                  fileSystemEntityModel:
                      FileSystemEntityModel(path: rootDirectory.path),
                  isDirectory: true),
              TreeNodeModel(
                  parent: null,
                  children: [],
                  isExpanded: false,
                  fileSystemEntityModel: FileSystemEntityModel(
                      path: RootPath.application.toString()),
                  isDirectory: true),
            ],
            parent: null,
            isExpanded: false,
            fileSystemEntityModel: FileSystemEntityModel(path: ""),
            isDirectory: true);
      }
      return TreeNodeModel(
          parent: null,
          children: [],
          isExpanded: false,
          fileSystemEntityModel: FileSystemEntityModel(path: ""),
          isDirectory: true);
    }
    return defaultState!;
  }

  list() async {
    final TreeNodeModel treeNodeModel = state.value!;
    if (treeNodeModel.isExpanded) {
      state = AsyncValue.data(
          state.value!.copyWith(isExpanded: false, children: []));
      listKey.currentState!.removeAllItems(
        (context, animation) {
          return Container();
        },
      );
      return;
    }
    state = AsyncValue.data(state.value!.copyWith(isExpanded: true));
    if (treeNodeModel.fileSystemEntityModel.path ==
        RootPath.application.toString()) {
      state = await AsyncValue.guard(() async {
        final applications = await PlatformUtils.getInstalledApplications();
        return state.value!.copyWith(children: [
          ...state.value!.children,
          ...applications
              .map((item) => TreeNodeModel(
                  parent: treeNodeModel,
                  children: [],
                  isExpanded: false,
                  fileSystemEntityModel:
                      FileSystemEntityModel(path: item.label),
                  isDirectory: true))
              .toList()
        ]);
      });
      listKey.currentState!.insertAllItems(treeNodeModel.children.length,
          state.value!.children.length - treeNodeModel.children.length);
      return;
    }
    final directory = Directory(treeNodeModel.fileSystemEntityModel.path);
    print("directory.listSync():" + directory.listSync().toString());
    directory.list().listen(
      (FileSystemEntity fileSystemEntity) async {
        print("fileSystemEntity:" + fileSystemEntity.toString());
        final path = fileSystemEntity.absolute.path;
        bool isDirectory = await FileSystemEntity.isDirectory(path);
        state = AsyncValue.data(state.value!.copyWith(children: [
          ...state.value!.children,
          TreeNodeModel(
              parent: treeNodeModel,
              children: [],
              isExpanded: false,
              fileSystemEntityModel: FileSystemEntityModel(path: path),
              isDirectory: isDirectory)
        ]));
        listKey.currentState!.insertItem(state.value!.children.length - 1);
      },
      onDone: () {},
    );
  }

  init() async {}
}
