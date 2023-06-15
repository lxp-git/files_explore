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
            String? filter)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
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
abstract class _$$TreeNodeFileSystemEntityCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeFileSystemEntityCopyWith(_$TreeNodeFileSystemEntity value,
          $Res Function(_$TreeNodeFileSystemEntity) then) =
      __$$TreeNodeFileSystemEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
      List<TreeNodeModel>? children,
      TreeNodeModel? parent,
      TreeExpanded? expanded,
      String? filter});

  @override
  $TreeNodeModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$TreeNodeFileSystemEntityCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeFileSystemEntity>
    implements _$$TreeNodeFileSystemEntityCopyWith<$Res> {
  __$$TreeNodeFileSystemEntityCopyWithImpl(_$TreeNodeFileSystemEntity _value,
      $Res Function(_$TreeNodeFileSystemEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileSystemEntity = null,
    Object? children = freezed,
    Object? parent = freezed,
    Object? expanded = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$TreeNodeFileSystemEntity(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeFileSystemEntity implements TreeNodeFileSystemEntity {
  _$TreeNodeFileSystemEntity(
      {@FileSystemEntityJSONConverter() required this.fileSystemEntity,
      final List<TreeNodeModel>? children,
      this.parent,
      this.expanded,
      this.filter,
      final String? $type})
      : _children = children,
        $type = $type ?? 'fileSystemEntity';

  factory _$TreeNodeFileSystemEntity.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeFileSystemEntityFromJson(json);

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TreeNodeModel.fileSystemEntity(fileSystemEntity: $fileSystemEntity, children: $children, parent: $parent, expanded: $expanded, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeFileSystemEntity &&
            (identical(other.fileSystemEntity, fileSystemEntity) ||
                other.fileSystemEntity == fileSystemEntity) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fileSystemEntity,
      const DeepCollectionEquality().hash(_children), parent, expanded, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeFileSystemEntityCopyWith<_$TreeNodeFileSystemEntity>
      get copyWith =>
          __$$TreeNodeFileSystemEntityCopyWithImpl<_$TreeNodeFileSystemEntity>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
  }) {
    return fileSystemEntity(
        this.fileSystemEntity, children, parent, expanded, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
  }) {
    return fileSystemEntity?.call(
        this.fileSystemEntity, children, parent, expanded, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
    required TResult orElse(),
  }) {
    if (fileSystemEntity != null) {
      return fileSystemEntity(
          this.fileSystemEntity, children, parent, expanded, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TreeNodeFileSystemEntity value) fileSystemEntity,
    required TResult Function(TreeNodeAndroidApplication value)
        androidApplication,
  }) {
    return fileSystemEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
  }) {
    return fileSystemEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    required TResult orElse(),
  }) {
    if (fileSystemEntity != null) {
      return fileSystemEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeFileSystemEntityToJson(
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
      final String? filter}) = _$TreeNodeFileSystemEntity;

  factory TreeNodeFileSystemEntity.fromJson(Map<String, dynamic> json) =
      _$TreeNodeFileSystemEntity.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$TreeNodeFileSystemEntityCopyWith<_$TreeNodeFileSystemEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TreeNodeAndroidApplicationCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeAndroidApplicationCopyWith(
          _$TreeNodeAndroidApplication value,
          $Res Function(_$TreeNodeAndroidApplication) then) =
      __$$TreeNodeAndroidApplicationCopyWithImpl<$Res>;
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
class __$$TreeNodeAndroidApplicationCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeAndroidApplication>
    implements _$$TreeNodeAndroidApplicationCopyWith<$Res> {
  __$$TreeNodeAndroidApplicationCopyWithImpl(
      _$TreeNodeAndroidApplication _value,
      $Res Function(_$TreeNodeAndroidApplication) _then)
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
    return _then(_$TreeNodeAndroidApplication(
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
class _$TreeNodeAndroidApplication implements TreeNodeAndroidApplication {
  _$TreeNodeAndroidApplication(
      {required this.androidApplication,
      final List<TreeNodeModel>? children,
      this.expanded,
      this.parent,
      this.filter,
      final String? $type})
      : _children = children,
        $type = $type ?? 'androidApplication';

  factory _$TreeNodeAndroidApplication.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeAndroidApplicationFromJson(json);

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
            other is _$TreeNodeAndroidApplication &&
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
  _$$TreeNodeAndroidApplicationCopyWith<_$TreeNodeAndroidApplication>
      get copyWith => __$$TreeNodeAndroidApplicationCopyWithImpl<
          _$TreeNodeAndroidApplication>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @FileSystemEntityJSONConverter() FileSystemEntity fileSystemEntity,
            List<TreeNodeModel>? children,
            TreeNodeModel? parent,
            TreeExpanded? expanded,
            String? filter)
        fileSystemEntity,
    required TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)
        androidApplication,
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
            String? filter)?
        fileSystemEntity,
    TResult? Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
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
            String? filter)?
        fileSystemEntity,
    TResult Function(
            AndroidApplication androidApplication,
            List<TreeNodeModel>? children,
            TreeExpanded? expanded,
            TreeNodeModel? parent,
            String? filter)?
        androidApplication,
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
  }) {
    return androidApplication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult? Function(TreeNodeAndroidApplication value)? androidApplication,
  }) {
    return androidApplication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TreeNodeFileSystemEntity value)? fileSystemEntity,
    TResult Function(TreeNodeAndroidApplication value)? androidApplication,
    required TResult orElse(),
  }) {
    if (androidApplication != null) {
      return androidApplication(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeAndroidApplicationToJson(
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
      final String? filter}) = _$TreeNodeAndroidApplication;

  factory TreeNodeAndroidApplication.fromJson(Map<String, dynamic> json) =
      _$TreeNodeAndroidApplication.fromJson;

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
  _$$TreeNodeAndroidApplicationCopyWith<_$TreeNodeAndroidApplication>
      get copyWith => throw _privateConstructorUsedError;
}
