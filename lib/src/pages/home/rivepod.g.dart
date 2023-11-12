// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rivepod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeNodeFileSystemEntityImpl _$$TreeNodeFileSystemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeFileSystemEntityImpl(
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
      selected: json['selected'] as bool?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TreeNodeFileSystemEntityImplToJson(
        _$TreeNodeFileSystemEntityImpl instance) =>
    <String, dynamic>{
      'fileSystemEntity': const FileSystemEntityJSONConverter()
          .toJson(instance.fileSystemEntity),
      'children': instance.children,
      'parent': instance.parent,
      'expanded': _$TreeExpandedEnumMap[instance.expanded],
      'filter': instance.filter,
      'selected': instance.selected,
      'runtimeType': instance.$type,
    };

const _$TreeExpandedEnumMap = {
  TreeExpanded.close: 'close',
  TreeExpanded.loading: 'loading',
  TreeExpanded.ok: 'ok',
};

_$TreeNodeAndroidApplicationImpl _$$TreeNodeAndroidApplicationImplFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeAndroidApplicationImpl(
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

Map<String, dynamic> _$$TreeNodeAndroidApplicationImplToJson(
        _$TreeNodeAndroidApplicationImpl instance) =>
    <String, dynamic>{
      'androidApplication': instance.androidApplication,
      'children': instance.children,
      'expanded': _$TreeExpandedEnumMap[instance.expanded],
      'parent': instance.parent,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$TreeNodeAndroidActivityImpl _$$TreeNodeAndroidActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeAndroidActivityImpl(
      androidActivity: AndroidActivity.fromJson(
          json['androidActivity'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$TreeNodeAndroidActivityImplToJson(
        _$TreeNodeAndroidActivityImpl instance) =>
    <String, dynamic>{
      'androidActivity': instance.androidActivity,
      'children': instance.children,
      'expanded': _$TreeExpandedEnumMap[instance.expanded],
      'parent': instance.parent,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$TreeNodeSftpNameImpl _$$TreeNodeSftpNameImplFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeSftpNameImpl(
      sftpName: const SftpJSONConverter()
          .fromJson(json['sftpName'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$TreeNodeSftpNameImplToJson(
        _$TreeNodeSftpNameImpl instance) =>
    <String, dynamic>{
      'sftpName': const SftpJSONConverter().toJson(instance.sftpName),
      'children': instance.children,
      'expanded': _$TreeExpandedEnumMap[instance.expanded],
      'parent': instance.parent,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$TreeNodeSftpServerImpl _$$TreeNodeSftpServerImplFromJson(
        Map<String, dynamic> json) =>
    _$TreeNodeSftpServerImpl(
      sftpServer:
          SftpServer.fromJson(json['sftpServer'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$TreeNodeSftpServerImplToJson(
        _$TreeNodeSftpServerImpl instance) =>
    <String, dynamic>{
      'sftpServer': instance.sftpServer,
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
    r'4eda5324eadf8d8c23aabf92d0f214be605cea5e';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
