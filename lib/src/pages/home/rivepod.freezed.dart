// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rivepod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TreeNodeModel _$TreeNodeModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'fileSystemEntity':
      return TreeNodeFileSystemEntity.fromJson(json);
    case 'androidApplication':
      return TreeNodeAndroidApplication.fromJson(json);
    case 'androidActivity':
      return TreeNodeAndroidActivity.fromJson(json);
    case 'sftp':
      return TreeNodeSftpName.fromJson(json);
    case 'sftpServer':
      return TreeNodeSftpServer.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TreeNodeModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TreeNodeModel {
  List<TreeNodeModel>? get children => throw _privateConstructorUsedError;
  TreeNodeModel? get parent => throw _privateConstructorUsedError;
  TreeExpanded? get expanded => throw _privateConstructorUsedError;
  String? get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
    required TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidActivity,
    required TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftp,
    required TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftpServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult? Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult? Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult? Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
    required TResult Function(TreeNodeAndroidActivity value) androidActivity,
    required TResult Function(TreeNodeSftpName value) sftp,
    required TResult Function(TreeNodeSftpServer value) sftpServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult? Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult? Function(TreeNodeSftpName value)? sftp,
    TResult? Function(TreeNodeSftpServer value)? sftpServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult Function(TreeNodeSftpName value)? sftp,
    TResult Function(TreeNodeSftpServer value)? sftpServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreeNodeModelCopyWith<TreeNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeModelCopyWith<$Res> {
  factory $TreeNodeModelCopyWith(
          TreeNodeModel value, $Res Function(TreeNodeModel) then) =
      _$TreeNodeModelCopyWithImpl<$Res, TreeNodeModel>;
  @useResult
  $Res call(
      {List<TreeNodeModel>? children,
      TreeNodeModel? parent,
      TreeExpanded? expanded,
      String? filter});

  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$TreeNodeModelCopyWithImpl<$Res, $Val extends TreeNodeModel>
    implements $TreeNodeModelCopyWith<$Res> {
  _$TreeNodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
    Object? parent = freezed,
    Object? expanded = freezed,
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeNodeModel?,
      expanded: freezed == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as TreeExpanded?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TreeNodeModelCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $TreeNodeModelCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TreeNodeFileSystemEntityImplCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeFileSystemEntityImplCopyWith(
          _$TreeNodeFileSystemEntityImpl value,
          $Res Function(_$TreeNodeFileSystemEntityImpl) then) =
      __$$TreeNodeFileSystemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
      List<TreeNodeModel>? children,
      TreeNodeModel? parent,
      TreeExpanded? expanded,
      String? filter,
      bool? selected});

  @override
  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$TreeNodeFileSystemEntityImplCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeFileSystemEntityImpl>
    implements _$$TreeNodeFileSystemEntityImplCopyWith<$Res> {
  __$$TreeNodeFileSystemEntityImplCopyWithImpl(
      _$TreeNodeFileSystemEntityImpl _value,
      $Res Function(_$TreeNodeFileSystemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileSystemEntity = null,
    Object? children = freezed,
    Object? parent = freezed,
    Object? expanded = freezed,
    Object? filter = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$TreeNodeFileSystemEntityImpl(
      fileSystemEntity: null == fileSystemEntity
          ? _value.fileSystemEntity
          : fileSystemEntity // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeNodeModel?,
      expanded: freezed == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as TreeExpanded?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeFileSystemEntityImpl implements TreeNodeFileSystemEntity {
  _$TreeNodeFileSystemEntityImpl(
      {@FileSystemEntityJSONConverter() required this.fileSystemEntity,
      final List<TreeNodeModel>? children,
      this.parent,
      this.expanded,
      this.filter,
      this.selected,
      final String? $type})
      : _children = children,
        $type = $type ?? 'fileSystemEntity';

  factory _$TreeNodeFileSystemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeFileSystemEntityImplFromJson(json);

  @override
  @FileSystemEntityJSONConverter()
  final FileSystemEntity fileSystemEntity;
  final List<TreeNodeModel>? _children;
  @override
  List<TreeNodeModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TreeNodeModel? parent;
  @override
  final TreeExpanded? expanded;
  @override
  final String? filter;
  @override
  final bool? selected;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TreeNodeModel.fileSystemEntity(fileSystemEntity: $fileSystemEntity, children: $children, parent: $parent, expanded: $expanded, filter: $filter, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeFileSystemEntityImpl &&
            (identical(other.fileSystemEntity, fileSystemEntity) ||
                other.fileSystemEntity == fileSystemEntity) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fileSystemEntity,
      const DeepCollectionEquality().hash(_children),
      parent,
      expanded,
      filter,
      selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeFileSystemEntityImplCopyWith<_$TreeNodeFileSystemEntityImpl>
      get copyWith => __$$TreeNodeFileSystemEntityImplCopyWithImpl<
          _$TreeNodeFileSystemEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
    required TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidActivity,
    required TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftp,
    required TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftpServer,
  }) {
    return fileSystemEntity(
        this.fileSystemEntity, children, parent, expanded, filter, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult? Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult? Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult? Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
  }) {
    return fileSystemEntity?.call(
        this.fileSystemEntity, children, parent, expanded, filter, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
    required TResult orElse(),
  }) {
    if (fileSystemEntity != null) {
      return fileSystemEntity(
          this.fileSystemEntity, children, parent, expanded, filter, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
    required TResult Function(TreeNodeAndroidActivity value) androidActivity,
    required TResult Function(TreeNodeSftpName value) sftp,
    required TResult Function(TreeNodeSftpServer value) sftpServer,
  }) {
    return fileSystemEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult? Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult? Function(TreeNodeSftpName value)? sftp,
    TResult? Function(TreeNodeSftpServer value)? sftpServer,
  }) {
    return fileSystemEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult Function(TreeNodeSftpName value)? sftp,
    TResult Function(TreeNodeSftpServer value)? sftpServer,
    required TResult orElse(),
  }) {
    if (fileSystemEntity != null) {
      return fileSystemEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeFileSystemEntityImplToJson(
      this,
    );
  }
}

abstract class TreeNodeFileSystemEntity implements TreeNodeModel, TreeNode {
  factory TreeNodeFileSystemEntity(
      {@FileSystemEntityJSONConverter()
      required final FileSystemEntity fileSystemEntity,
      final List<TreeNodeModel>? children,
      final TreeNodeModel? parent,
      final TreeExpanded? expanded,
      final String? filter,
      final bool? selected}) = _$TreeNodeFileSystemEntityImpl;

  factory TreeNodeFileSystemEntity.fromJson(Map<String, dynamic> json) =
      _$TreeNodeFileSystemEntityImpl.fromJson;

  @FileSystemEntityJSONConverter()
  FileSystemEntity get fileSystemEntity;
  @override
  List<TreeNodeModel>? get children;
  @override
  TreeNodeModel? get parent;
  @override
  TreeExpanded? get expanded;
  @override
  String? get filter;
  bool? get selected;
  @override
  @JsonKey(ignore: true)
  _$$TreeNodeFileSystemEntityImplCopyWith<_$TreeNodeFileSystemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeNodeAndroidApplicationImplCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeAndroidApplicationImplCopyWith(
          _$TreeNodeAndroidApplicationImpl value,
          $Res Function(_$TreeNodeAndroidApplicationImpl) then) =
      __$$TreeNodeAndroidApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AndroidApplication androidApplication,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter});

  $AndroidApplicationCopyWith<$Res> get androidApplication;
  @override
  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$TreeNodeAndroidApplicationImplCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeAndroidApplicationImpl>
    implements _$$TreeNodeAndroidApplicationImplCopyWith<$Res> {
  __$$TreeNodeAndroidApplicationImplCopyWithImpl(
      _$TreeNodeAndroidApplicationImpl _value,
      $Res Function(_$TreeNodeAndroidApplicationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidApplication = null,
    Object? children = freezed,
    Object? expanded = freezed,
    Object? parent = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$TreeNodeAndroidApplicationImpl(
      androidApplication: null == androidApplication
          ? _value.androidApplication
          : androidApplication // ignore: cast_nullable_to_non_nullable
              as AndroidApplication,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>?,
      expanded: freezed == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as TreeExpanded?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeNodeModel?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AndroidApplicationCopyWith<$Res> get androidApplication {
    return $AndroidApplicationCopyWith<$Res>(_value.androidApplication,
        (value) {
      return _then(_value.copyWith(androidApplication: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeAndroidApplicationImpl implements TreeNodeAndroidApplication {
  _$TreeNodeAndroidApplicationImpl(
      {required this.androidApplication,
      final List<TreeNodeModel>? children,
      this.expanded,
      this.parent,
      this.filter,
      final String? $type})
      : _children = children,
        $type = $type ?? 'androidApplication';

  factory _$TreeNodeAndroidApplicationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TreeNodeAndroidApplicationImplFromJson(json);

  @override
  final AndroidApplication androidApplication;
  final List<TreeNodeModel>? _children;
  @override
  List<TreeNodeModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TreeExpanded? expanded;
  @override
  final TreeNodeModel? parent;
  @override
  final String? filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TreeNodeModel.androidApplication(androidApplication: $androidApplication, children: $children, expanded: $expanded, parent: $parent, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeAndroidApplicationImpl &&
            (identical(other.androidApplication, androidApplication) ||
                other.androidApplication == androidApplication) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, androidApplication,
      const DeepCollectionEquality().hash(_children), expanded, parent, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeAndroidApplicationImplCopyWith<_$TreeNodeAndroidApplicationImpl>
      get copyWith => __$$TreeNodeAndroidApplicationImplCopyWithImpl<
          _$TreeNodeAndroidApplicationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
    required TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidActivity,
    required TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftp,
    required TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftpServer,
  }) {
    return androidApplication(
        this.androidApplication, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult? Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult? Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult? Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
  }) {
    return androidApplication?.call(
        this.androidApplication, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
    required TResult orElse(),
  }) {
    if (androidApplication != null) {
      return androidApplication(
          this.androidApplication, children, expanded, parent, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
    required TResult Function(TreeNodeAndroidActivity value) androidActivity,
    required TResult Function(TreeNodeSftpName value) sftp,
    required TResult Function(TreeNodeSftpServer value) sftpServer,
  }) {
    return androidApplication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult? Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult? Function(TreeNodeSftpName value)? sftp,
    TResult? Function(TreeNodeSftpServer value)? sftpServer,
  }) {
    return androidApplication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult Function(TreeNodeSftpName value)? sftp,
    TResult Function(TreeNodeSftpServer value)? sftpServer,
    required TResult orElse(),
  }) {
    if (androidApplication != null) {
      return androidApplication(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeAndroidApplicationImplToJson(
      this,
    );
  }
}

abstract class TreeNodeAndroidApplication implements TreeNodeModel, TreeNode {
  factory TreeNodeAndroidApplication(
      {required final AndroidApplication androidApplication,
      final List<TreeNodeModel>? children,
      final TreeExpanded? expanded,
      final TreeNodeModel? parent,
      final String? filter}) = _$TreeNodeAndroidApplicationImpl;

  factory TreeNodeAndroidApplication.fromJson(Map<String, dynamic> json) =
      _$TreeNodeAndroidApplicationImpl.fromJson;

  AndroidApplication get androidApplication;
  @override
  List<TreeNodeModel>? get children;
  @override
  TreeExpanded? get expanded;
  @override
  TreeNodeModel? get parent;
  @override
  String? get filter;
  @override
  @JsonKey(ignore: true)
  _$$TreeNodeAndroidApplicationImplCopyWith<_$TreeNodeAndroidApplicationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeNodeAndroidActivityImplCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeAndroidActivityImplCopyWith(
          _$TreeNodeAndroidActivityImpl value,
          $Res Function(_$TreeNodeAndroidActivityImpl) then) =
      __$$TreeNodeAndroidActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AndroidActivity androidActivity,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter});

  $AndroidActivityCopyWith<$Res> get androidActivity;
  @override
  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$TreeNodeAndroidActivityImplCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeAndroidActivityImpl>
    implements _$$TreeNodeAndroidActivityImplCopyWith<$Res> {
  __$$TreeNodeAndroidActivityImplCopyWithImpl(
      _$TreeNodeAndroidActivityImpl _value,
      $Res Function(_$TreeNodeAndroidActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidActivity = null,
    Object? children = freezed,
    Object? expanded = freezed,
    Object? parent = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$TreeNodeAndroidActivityImpl(
      androidActivity: null == androidActivity
          ? _value.androidActivity
          : androidActivity // ignore: cast_nullable_to_non_nullable
              as AndroidActivity,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>?,
      expanded: freezed == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as TreeExpanded?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeNodeModel?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AndroidActivityCopyWith<$Res> get androidActivity {
    return $AndroidActivityCopyWith<$Res>(_value.androidActivity, (value) {
      return _then(_value.copyWith(androidActivity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeAndroidActivityImpl implements TreeNodeAndroidActivity {
  _$TreeNodeAndroidActivityImpl(
      {required this.androidActivity,
      final List<TreeNodeModel>? children,
      this.expanded,
      this.parent,
      this.filter,
      final String? $type})
      : _children = children,
        $type = $type ?? 'androidActivity';

  factory _$TreeNodeAndroidActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeAndroidActivityImplFromJson(json);

  @override
  final AndroidActivity androidActivity;
  final List<TreeNodeModel>? _children;
  @override
  List<TreeNodeModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TreeExpanded? expanded;
  @override
  final TreeNodeModel? parent;
  @override
  final String? filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TreeNodeModel.androidActivity(androidActivity: $androidActivity, children: $children, expanded: $expanded, parent: $parent, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeAndroidActivityImpl &&
            (identical(other.androidActivity, androidActivity) ||
                other.androidActivity == androidActivity) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, androidActivity,
      const DeepCollectionEquality().hash(_children), expanded, parent, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeAndroidActivityImplCopyWith<_$TreeNodeAndroidActivityImpl>
      get copyWith => __$$TreeNodeAndroidActivityImplCopyWithImpl<
          _$TreeNodeAndroidActivityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
    required TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidActivity,
    required TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftp,
    required TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftpServer,
  }) {
    return androidActivity(
        this.androidActivity, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult? Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult? Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult? Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
  }) {
    return androidActivity?.call(
        this.androidActivity, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
    required TResult orElse(),
  }) {
    if (androidActivity != null) {
      return androidActivity(
          this.androidActivity, children, expanded, parent, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
    required TResult Function(TreeNodeAndroidActivity value) androidActivity,
    required TResult Function(TreeNodeSftpName value) sftp,
    required TResult Function(TreeNodeSftpServer value) sftpServer,
  }) {
    return androidActivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult? Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult? Function(TreeNodeSftpName value)? sftp,
    TResult? Function(TreeNodeSftpServer value)? sftpServer,
  }) {
    return androidActivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult Function(TreeNodeSftpName value)? sftp,
    TResult Function(TreeNodeSftpServer value)? sftpServer,
    required TResult orElse(),
  }) {
    if (androidActivity != null) {
      return androidActivity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeAndroidActivityImplToJson(
      this,
    );
  }
}

abstract class TreeNodeAndroidActivity implements TreeNodeModel, TreeNode {
  factory TreeNodeAndroidActivity(
      {required final AndroidActivity androidActivity,
      final List<TreeNodeModel>? children,
      final TreeExpanded? expanded,
      final TreeNodeModel? parent,
      final String? filter}) = _$TreeNodeAndroidActivityImpl;

  factory TreeNodeAndroidActivity.fromJson(Map<String, dynamic> json) =
      _$TreeNodeAndroidActivityImpl.fromJson;

  AndroidActivity get androidActivity;
  @override
  List<TreeNodeModel>? get children;
  @override
  TreeExpanded? get expanded;
  @override
  TreeNodeModel? get parent;
  @override
  String? get filter;
  @override
  @JsonKey(ignore: true)
  _$$TreeNodeAndroidActivityImplCopyWith<_$TreeNodeAndroidActivityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeNodeSftpNameImplCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeSftpNameImplCopyWith(_$TreeNodeSftpNameImpl value,
          $Res Function(_$TreeNodeSftpNameImpl) then) =
      __$$TreeNodeSftpNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SftpJSONConverter() SftpName sftpName,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter});

  @override
  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$TreeNodeSftpNameImplCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeSftpNameImpl>
    implements _$$TreeNodeSftpNameImplCopyWith<$Res> {
  __$$TreeNodeSftpNameImplCopyWithImpl(_$TreeNodeSftpNameImpl _value,
      $Res Function(_$TreeNodeSftpNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sftpName = null,
    Object? children = freezed,
    Object? expanded = freezed,
    Object? parent = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$TreeNodeSftpNameImpl(
      sftpName: null == sftpName
          ? _value.sftpName
          : sftpName // ignore: cast_nullable_to_non_nullable
              as SftpName,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>?,
      expanded: freezed == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as TreeExpanded?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeNodeModel?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeSftpNameImpl implements TreeNodeSftpName {
  _$TreeNodeSftpNameImpl(
      {@SftpJSONConverter() required this.sftpName,
      final List<TreeNodeModel>? children,
      this.expanded,
      this.parent,
      this.filter,
      final String? $type})
      : _children = children,
        $type = $type ?? 'sftp';

  factory _$TreeNodeSftpNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeSftpNameImplFromJson(json);

  @override
  @SftpJSONConverter()
  final SftpName sftpName;
  final List<TreeNodeModel>? _children;
  @override
  List<TreeNodeModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TreeExpanded? expanded;
  @override
  final TreeNodeModel? parent;
  @override
  final String? filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TreeNodeModel.sftp(sftpName: $sftpName, children: $children, expanded: $expanded, parent: $parent, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeSftpNameImpl &&
            (identical(other.sftpName, sftpName) ||
                other.sftpName == sftpName) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sftpName,
      const DeepCollectionEquality().hash(_children), expanded, parent, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeSftpNameImplCopyWith<_$TreeNodeSftpNameImpl> get copyWith =>
      __$$TreeNodeSftpNameImplCopyWithImpl<_$TreeNodeSftpNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
    required TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidActivity,
    required TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftp,
    required TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftpServer,
  }) {
    return sftp(sftpName, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult? Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult? Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult? Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
  }) {
    return sftp?.call(sftpName, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
    required TResult orElse(),
  }) {
    if (sftp != null) {
      return sftp(sftpName, children, expanded, parent, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
    required TResult Function(TreeNodeAndroidActivity value) androidActivity,
    required TResult Function(TreeNodeSftpName value) sftp,
    required TResult Function(TreeNodeSftpServer value) sftpServer,
  }) {
    return sftp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult? Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult? Function(TreeNodeSftpName value)? sftp,
    TResult? Function(TreeNodeSftpServer value)? sftpServer,
  }) {
    return sftp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult Function(TreeNodeSftpName value)? sftp,
    TResult Function(TreeNodeSftpServer value)? sftpServer,
    required TResult orElse(),
  }) {
    if (sftp != null) {
      return sftp(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeSftpNameImplToJson(
      this,
    );
  }
}

abstract class TreeNodeSftpName implements TreeNodeModel, TreeNode {
  factory TreeNodeSftpName(
      {@SftpJSONConverter() required final SftpName sftpName,
      final List<TreeNodeModel>? children,
      final TreeExpanded? expanded,
      final TreeNodeModel? parent,
      final String? filter}) = _$TreeNodeSftpNameImpl;

  factory TreeNodeSftpName.fromJson(Map<String, dynamic> json) =
      _$TreeNodeSftpNameImpl.fromJson;

  @SftpJSONConverter()
  SftpName get sftpName;
  @override
  List<TreeNodeModel>? get children;
  @override
  TreeExpanded? get expanded;
  @override
  TreeNodeModel? get parent;
  @override
  String? get filter;
  @override
  @JsonKey(ignore: true)
  _$$TreeNodeSftpNameImplCopyWith<_$TreeNodeSftpNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeNodeSftpServerImplCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeSftpServerImplCopyWith(_$TreeNodeSftpServerImpl value,
          $Res Function(_$TreeNodeSftpServerImpl) then) =
      __$$TreeNodeSftpServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SftpJSONConverter() SftpServer sftpServer,
      List<TreeNodeModel>? children,
      TreeExpanded? expanded,
      TreeNodeModel? parent,
      String? filter});

  $SftpServerCopyWith<$Res> get sftpServer;
  @override
  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$TreeNodeSftpServerImplCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeSftpServerImpl>
    implements _$$TreeNodeSftpServerImplCopyWith<$Res> {
  __$$TreeNodeSftpServerImplCopyWithImpl(_$TreeNodeSftpServerImpl _value,
      $Res Function(_$TreeNodeSftpServerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sftpServer = null,
    Object? children = freezed,
    Object? expanded = freezed,
    Object? parent = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$TreeNodeSftpServerImpl(
      sftpServer: null == sftpServer
          ? _value.sftpServer
          : sftpServer // ignore: cast_nullable_to_non_nullable
              as SftpServer,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>?,
      expanded: freezed == expanded
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as TreeExpanded?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as TreeNodeModel?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SftpServerCopyWith<$Res> get sftpServer {
    return $SftpServerCopyWith<$Res>(_value.sftpServer, (value) {
      return _then(_value.copyWith(sftpServer: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeSftpServerImpl implements TreeNodeSftpServer {
  _$TreeNodeSftpServerImpl(
      {@SftpJSONConverter() required this.sftpServer,
      final List<TreeNodeModel>? children,
      this.expanded,
      this.parent,
      this.filter,
      final String? $type})
      : _children = children,
        $type = $type ?? 'sftpServer';

  factory _$TreeNodeSftpServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeSftpServerImplFromJson(json);

  @override
  @SftpJSONConverter()
  final SftpServer sftpServer;
  final List<TreeNodeModel>? _children;
  @override
  List<TreeNodeModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TreeExpanded? expanded;
  @override
  final TreeNodeModel? parent;
  @override
  final String? filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TreeNodeModel.sftpServer(sftpServer: $sftpServer, children: $children, expanded: $expanded, parent: $parent, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeSftpServerImpl &&
            (identical(other.sftpServer, sftpServer) ||
                other.sftpServer == sftpServer) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sftpServer,
      const DeepCollectionEquality().hash(_children), expanded, parent, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeSftpServerImplCopyWith<_$TreeNodeSftpServerImpl> get copyWith =>
      __$$TreeNodeSftpServerImplCopyWithImpl<_$TreeNodeSftpServerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
    required TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidActivity,
    required TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftp,
    required TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        sftpServer,
  }) {
    return sftpServer(this.sftpServer, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult? Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult? Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult? Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
  }) {
    return sftpServer?.call(
        this.sftpServer, children, expanded, parent, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter,
            bool? selected)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    TResult Function(
            AndroidActivity androidActivity,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidActivity,
    TResult Function(
            @SftpJSONConverter() SftpName sftpName,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftp,
    TResult Function(
            @SftpJSONConverter() SftpServer sftpServer,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        sftpServer,
    required TResult orElse(),
  }) {
    if (sftpServer != null) {
      return sftpServer(this.sftpServer, children, expanded, parent, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
    required TResult Function(TreeNodeAndroidActivity value) androidActivity,
    required TResult Function(TreeNodeSftpName value) sftp,
    required TResult Function(TreeNodeSftpServer value) sftpServer,
  }) {
    return sftpServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult? Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult? Function(TreeNodeSftpName value)? sftp,
    TResult? Function(TreeNodeSftpServer value)? sftpServer,
  }) {
    return sftpServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    TResult Function(TreeNodeAndroidActivity value)? androidActivity,
    TResult Function(TreeNodeSftpName value)? sftp,
    TResult Function(TreeNodeSftpServer value)? sftpServer,
    required TResult orElse(),
  }) {
    if (sftpServer != null) {
      return sftpServer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeSftpServerImplToJson(
      this,
    );
  }
}

abstract class TreeNodeSftpServer implements TreeNodeModel, TreeNode {
  factory TreeNodeSftpServer(
      {@SftpJSONConverter() required final SftpServer sftpServer,
      final List<TreeNodeModel>? children,
      final TreeExpanded? expanded,
      final TreeNodeModel? parent,
      final String? filter}) = _$TreeNodeSftpServerImpl;

  factory TreeNodeSftpServer.fromJson(Map<String, dynamic> json) =
      _$TreeNodeSftpServerImpl.fromJson;

  @SftpJSONConverter()
  SftpServer get sftpServer;
  @override
  List<TreeNodeModel>? get children;
  @override
  TreeExpanded? get expanded;
  @override
  TreeNodeModel? get parent;
  @override
  String? get filter;
  @override
  @JsonKey(ignore: true)
  _$$TreeNodeSftpServerImplCopyWith<_$TreeNodeSftpServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
