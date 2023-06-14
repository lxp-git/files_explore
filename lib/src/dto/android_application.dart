import 'package:freezed_annotation/freezed_annotation.dart';

part "android_application.freezed.dart";
part "android_application.g.dart";

@freezed
class AndroidApplication with _$AndroidApplication {
  factory AndroidApplication({
    required String label,
  }) = _AndroidApplication;

  factory AndroidApplication.fromJson(Map<String, Object?> json) =>
      _$AndroidApplicationFromJson(json);
}
