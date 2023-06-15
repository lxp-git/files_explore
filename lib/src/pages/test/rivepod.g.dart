// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rivepod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeNodeFileSystemEntity _$$TreeNodeFileSystemEntityFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeFileSystemEntity(
      fileSystemEntity: const FileSystemEntityJSONConverter()
          .fromJson(json['fileSystemEntity'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => TreeNodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      parent: json['parent'] == null
          ? null
          : TreeNodeModel.fromJson(json['parent'] as Map<String, dynamic>),
      expanded: $enumDecodeNullable(_$TreeExpandedEnumMap, json['expanded']),
      filter: json['filter'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TreeNodeFileSystemEntityToJson(
        _$TreeNodeFileSystemEntity instance) =>
    <String, dynamic>{
      'fileSystemEntity': const FileSystemEntityJSONConverter()
          .toJson(instance.fileSystemEntity),
      'children': instance.children,
      'parent': instance.parent,
      'expanded': _$TreeExpandedEnumMap[instance.expanded],
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

const _$TreeExpandedEnumMap = {
  TreeExpanded.close: 'close',
  TreeExpanded.loading: 'loading',
  TreeExpanded.ok: 'ok',
};

_$TreeNodeAndroidApplication _$$TreeNodeAndroidApplicationFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeAndroidApplication(
      androidApplication: AndroidApplication.fromJson(
          json['androidApplication'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => TreeNodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      expanded: $enumDecodeNullable(_$TreeExpandedEnumMap, json['expanded']),
      parent: json['parent'] == null
          ? null
          : TreeNodeModel.fromJson(json['parent'] as Map<String, dynamic>),
      filter: json['filter'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TreeNodeAndroidApplicationToJson(
        _$TreeNodeAndroidApplication instance) =>
    <String, dynamic>{
      'androidApplication': instance.androidApplication,
      'children': instance.children,
      'expanded': _$TreeExpandedEnumMap[instance.expanded],
      'parent': instance.parent,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncCurrentTreeNodeModelHash() =>
    r'09164d3235f405dfc5d9df796ac61008b5ac0277';

/// See also [AsyncCurrentTreeNodeModel].
@ProviderFor(AsyncCurrentTreeNodeModel)
final asyncCurrentTreeNodeModelProvider = AutoDisposeAsyncNotifierProvider<
    AsyncCurrentTreeNodeModel, TreeNodeModel>.internal(
  AsyncCurrentTreeNodeModel.new,
  name: r'asyncCurrentTreeNodeModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$asyncCurrentTreeNodeModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AsyncCurrentTreeNodeModel = AutoDisposeAsyncNotifier<TreeNodeModel>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
