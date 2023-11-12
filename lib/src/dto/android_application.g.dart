// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AndroidApplicationImpl _$$AndroidApplicationImplFromJson(
        Map<String, dynamic> json) =>
    _$AndroidApplicationImpl(
      label: json['label'] as String,
      packageName: json['packageName'] as String,
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => AndroidActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: _$JsonConverterFromJson<List<Map<String, dynamic>>,
              List<FileSystemEntity>>(
          json['files'], const FileSystemEntityListJSONConverter().fromJson),
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$AndroidApplicationImplToJson(
        _$AndroidApplicationImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'packageName': instance.packageName,
      'activities': instance.activities,
      'files': _$JsonConverterToJson<List<Map<String, dynamic>>,
              List<FileSystemEntity>>(
          instance.files, const FileSystemEntityListJSONConverter().toJson),
      'enabled': instance.enabled,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$AndroidActivityImpl _$$AndroidActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$AndroidActivityImpl(
      name: json['name'] as String,
      enabled: json['enabled'] as bool,
      packageName: json['packageName'] as String?,
    );

Map<String, dynamic> _$$AndroidActivityImplToJson(
        _$AndroidActivityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'enabled': instance.enabled,
      'packageName': instance.packageName,
    };
