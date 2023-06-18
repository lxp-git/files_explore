import 'package:freezed_annotation/freezed_annotation.dart';

part "android_application.freezed.dart";
part "android_application.g.dart";

@freezed
class AndroidApplication with _$AndroidApplication {
  factory AndroidApplication({
    required String label,
    required String packageName,
    required List<AndroidActivity>? activities,
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
