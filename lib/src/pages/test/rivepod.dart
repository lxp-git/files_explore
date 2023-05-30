import 'dart:async';
import 'dart:io';

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
      required TreeNodeModel? parent}) = _TreeNodeModel;

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
                      FileSystemEntityModel(path: rootDirectory.path)),
            ],
            parent: null,
            isExpanded: false,
            fileSystemEntityModel: FileSystemEntityModel(path: ""));
      }
      return TreeNodeModel(
          parent: null,
          children: [],
          isExpanded: false,
          fileSystemEntityModel: FileSystemEntityModel(path: ""));
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
// Set the state to loading
    // state = const AsyncValue.loading();
    // Add the new todo and reload the todo list from the remote repository
    // state = await AsyncValue.guard(() async {
    //   final directory = Directory(treeNodeModel.fileSystemEntityModel.path);
    //   List<TreeNodeModel> treeNodeModelList = [];
    //   final completer = Completer<TreeNodeModel>();
    //   directory.list().listen((FileSystemEntity fileSystemEntity) {
    //     final oldChildren = state.value!.children;
    //     oldChildren.add(TreeNodeModel(
    //         parent: treeNodeModel,
    //         children: [],
    //         isExpanded: false,
    //         fileSystemEntityModel:
    //             FileSystemEntityModel(path: fileSystemEntity.path)));
    //   }, onDone: () {

    //   });
    //   return completer.future;
    // });
    final directory = Directory(treeNodeModel.fileSystemEntityModel.path);
    directory.list().listen((FileSystemEntity fileSystemEntity) {
      state = AsyncValue.data(state.value!.copyWith(children: [
        ...state.value!.children,
        TreeNodeModel(
            parent: treeNodeModel,
            children: [],
            isExpanded: false,
            fileSystemEntityModel:
                FileSystemEntityModel(path: fileSystemEntity.path))
      ]));
      listKey.currentState!.insertItem(state.value!.children.length - 1);
    });
  }

  init() async {}
}
