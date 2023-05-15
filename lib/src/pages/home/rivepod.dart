import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part "rivepod.freezed.dart";
part "rivepod.g.dart";

class TreeNodeModel {
  final List<FileSystemEntity> children;
  final FileSystemEntity fileSystemEntity;
  TreeNodeModel({required this.children, required this.fileSystemEntity});
}

@riverpod
class Home extends _$Home {
  @override
  List<TreeNodeModel> build() {
    init();
    return [];
  }

  init() async {
    await [Permission.storage, Permission.manageExternalStorage].request();
    final rootDirectory = await getExternalStorageDirectory();
    if (rootDirectory != null) {
      final files = rootDirectory.listSync() ?? [];
      state = [TreeNodeModel(children: files, fileSystemEntity: rootDirectory)];
    }
  }
}
