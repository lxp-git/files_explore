import 'dart:io';

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
class CurrentTreeNodeModel extends _$CurrentTreeNodeModel {
  final TreeNodeModel? defaultState;
  CurrentTreeNodeModel({this.defaultState});

  @override
  TreeNodeModel? build() {
    if (defaultState == null) {
      init();
    }

    return defaultState;
  }

  list() {
    final TreeNodeModel treeNodeModel = state!;
    state = state!.copyWith(
        children: state!.children
            .map((e) => e == treeNodeModel
                ? treeNodeModel.copyWith(isExpanded: true)
                : e)
            .toList());
    final directory = Directory(treeNodeModel.fileSystemEntityModel.path);
    List<TreeNodeModel> treeNodeModelList = [];
    directory.list().listen((FileSystemEntity fileSystemEntity) {
      treeNodeModelList.add(TreeNodeModel(
          parent: state!,
          children: [],
          isExpanded: false,
          fileSystemEntityModel:
              FileSystemEntityModel(path: fileSystemEntity.path)));
    }, onDone: () {
      state = state!.copyWith(children: treeNodeModelList);
    });
  }

  init() async {
    await [Permission.storage, Permission.manageExternalStorage].request();
    final rootDirectory = await getExternalStorageDirectory();
    if (rootDirectory != null) {
      state = TreeNodeModel(
          parent: null,
          children: [
            TreeNodeModel(
                parent: null,
                children: [],
                isExpanded: false,
                fileSystemEntityModel:
                    FileSystemEntityModel(path: rootDirectory.path)),
            TreeNodeModel(
              parent: null,
              children: [],
              isExpanded: false,
              fileSystemEntityModel: FileSystemEntityModel(path: "/"),
            ),
          ],
          isExpanded: false,
          fileSystemEntityModel: FileSystemEntityModel(path: ""));
    }
  }
}
