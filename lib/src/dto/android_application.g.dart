// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AndroidApplication _$$_AndroidApplicationFromJson(
        Map<String, dynamic> json) =>
    _$_AndroidApplication(
      label: json['label'] as String,
      packageName: json['packageName'] as String,
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => AndroidActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$_AndroidApplicationToJson(
        _$_AndroidApplication instance) =>
    <String, dynamic>{
      'label': instance.label,
      'packageName': instance.packageName,
      'activities': instance.activities,
      'enabled': instance.enabled,
    };

_$_AndroidActivity _$$_AndroidActivityFromJson(Map<String, dynamic> json) =>
    _$_AndroidActivity(
      name: json['name'] as String,
      enabled: json['enabled'] as bool,
      packageName: json['packageName'] as String?,
    );

Map<String, dynamic> _$$_AndroidActivityToJson(_$_AndroidActivity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'enabled': instance.enabled,
      'packageName': instance.packageName,
    };
