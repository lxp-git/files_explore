// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rivepod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileSystemEntityModel _$$_FileSystemEntityModelFromJson(
        Map<String, dynamic> json) =>
    _$_FileSystemEntityModel(
      path: json['path'] as String,
    );

Map<String, dynamic> _$$_FileSystemEntityModelToJson(
        _$_FileSystemEntityModel instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

_$_TreeNodeModel _$$_TreeNodeModelFromJson(Map<String, dynamic> json) =>
    _$_TreeNodeModel(
      children: (json['children'] as List<dynamic>)
          .map((e) => TreeNodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileSystemEntityModel: FileSystemEntityModel.fromJson(
          json['fileSystemEntityModel'] as Map<String, dynamic>),
      isExpanded: json['isExpanded'] as bool,
      parent: json['parent'] == null
          ? null
          : TreeNodeModel.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TreeNodeModelToJson(_$_TreeNodeModel instance) =>
    <String, dynamic>{
      'children': instance.children,
      'fileSystemEntityModel': instance.fileSystemEntityModel,
      'isExpanded': instance.isExpanded,
      'parent': instance.parent,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncCurrentTreeNodeModelHash() =>
    r'613d95c6c7f426a047f6115c0a4feeff48c5afb7';

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
