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
      required FileSystemEntityModel fileSystemEntityModel}) = _TreeNodeModel;

  factory TreeNodeModel.fromJson(Map<String, Object?> json) =>
      _$TreeNodeModelFromJson(json);
}

@riverpod
TreeNodeModel currentTreeNodeModel(ref) {
  throw UnimplementedError();
}

@riverpod
class Home extends _$Home {
  @override
  TreeNodeModel? build() {
    init();
    return null;
  }

  list(TreeNodeModel treeNodeModel) {
    final directory = Directory(treeNodeModel.fileSystemEntityModel.path);
    List<TreeNodeModel> treeNodeModelList = [];
    directory.list().listen((FileSystemEntity fileSystemEntity) {
      treeNodeModelList.add(TreeNodeModel(
          children: [],
          fileSystemEntityModel:
              FileSystemEntityModel(path: fileSystemEntity.path)));
      final newState = treeNodeModel.copyWith(children: [...treeNodeModelList]);
      state = newState;
    });
  }

  init() async {
    await [Permission.storage, Permission.manageExternalStorage].request();
    final rootDirectory = await getExternalStorageDirectory();
    if (rootDirectory != null) {
      state = TreeNodeModel(children: [
        TreeNodeModel(
            children: [],
            fileSystemEntityModel:
                FileSystemEntityModel(path: rootDirectory.path))
      ], fileSystemEntityModel: FileSystemEntityModel(path: ""));
    }
  }
}
