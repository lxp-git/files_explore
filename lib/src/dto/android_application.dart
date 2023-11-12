import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part "android_application.freezed.dart";
part "android_application.g.dart";

class FileSystemEntityListJSONConverter
    implements
        JsonConverter<List<FileSystemEntity>, List<Map<String, dynamic>>> {
  const FileSystemEntityListJSONConverter();

  @override
  List<FileSystemEntity> fromJson(List<Map<String, dynamic>> json) {
    return json
        .map((e) => FileSystemEntity.isDirectorySync(e["path"])
            ? Directory(e["path"])
            : File(e["path"]))
        .toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<FileSystemEntity> data) =>
      data.map((e) => {"path": e.path}).toList();
}

@freezed
class AndroidApplication with _$AndroidApplication {
  factory AndroidApplication({
    required String label,
    required String packageName,
    required List<AndroidActivity>? activities,
    @FileSystemEntityListJSONConverter() required List<FileSystemEntity>? files,
    required bool enabled,
  }) = _AndroidApplication;

  factory AndroidApplication.fromJson(Map<String, dynamic> json) =>
      _$AndroidApplicationFromJson(json);
}

@freezed
class AndroidActivity with _$AndroidActivity {
  factory AndroidActivity({
    required String name,
    required bool enabled,
    required String? packageName,
  }) = _AndroidActivity;

  factory AndroidActivity.fromJson(Map<String, dynamic> json) =>
      _$AndroidActivityFromJson(json);
}

// @freezed
// class AndroidApplicationFiles with _$AndroidActivity {
//   factory AndroidApplicationFiles({
//     required String name,
//     required bool enabled,
//     required String? packageName,
//   }) = _AndroidApplicationFiles;

//   factory AndroidApplicationFiles.fromJson(Map<String, dynamic> json) =>
//       _$AndroidApplicationFilesFromJson(json);
// }
