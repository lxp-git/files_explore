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
    );

Map<String, dynamic> _$$_TreeNodeModelToJson(_$_TreeNodeModel instance) =>
    <String, dynamic>{
      'children': instance.children,
      'fileSystemEntityModel': instance.fileSystemEntityModel,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTreeNodeModelHash() =>
    r'97cc092063bb7df87a75d71b26a9b71e0f6ad420';

/// See also [currentTreeNodeModel].
@ProviderFor(currentTreeNodeModel)
final currentTreeNodeModelProvider =
    AutoDisposeProvider<TreeNodeModel>.internal(
  currentTreeNodeModel,
  name: r'currentTreeNodeModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTreeNodeModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentTreeNodeModelRef = AutoDisposeProviderRef<TreeNodeModel>;
String _$homeHash() => r'59d134fc5b4fd7dd955204009acfc5762150c108';

/// See also [Home].
@ProviderFor(Home)
final homeProvider = AutoDisposeNotifierProvider<Home, TreeNodeModel?>.internal(
  Home.new,
  name: r'homeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Home = AutoDisposeNotifier<TreeNodeModel?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
