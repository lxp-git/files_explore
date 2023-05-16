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

FileSystemEntityModel _$FileSystemEntityModelFromJson(
    Map<String, dynamic> json) {
  return _FileSystemEntityModel.fromJson(json);
}

/// @nodoc
mixin _$FileSystemEntityModel {
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileSystemEntityModelCopyWith<FileSystemEntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileSystemEntityModelCopyWith<$Res> {
  factory $FileSystemEntityModelCopyWith(FileSystemEntityModel value,
          $Res Function(FileSystemEntityModel) then) =
      _$FileSystemEntityModelCopyWithImpl<$Res, FileSystemEntityModel>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$FileSystemEntityModelCopyWithImpl<$Res,
        $Val extends FileSystemEntityModel>
    implements $FileSystemEntityModelCopyWith<$Res> {
  _$FileSystemEntityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileSystemEntityModelCopyWith<$Res>
    implements $FileSystemEntityModelCopyWith<$Res> {
  factory _$$_FileSystemEntityModelCopyWith(_$_FileSystemEntityModel value,
          $Res Function(_$_FileSystemEntityModel) then) =
      __$$_FileSystemEntityModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$_FileSystemEntityModelCopyWithImpl<$Res>
    extends _$FileSystemEntityModelCopyWithImpl<$Res, _$_FileSystemEntityModel>
    implements _$$_FileSystemEntityModelCopyWith<$Res> {
  __$$_FileSystemEntityModelCopyWithImpl(_$_FileSystemEntityModel _value,
      $Res Function(_$_FileSystemEntityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$_FileSystemEntityModel(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileSystemEntityModel implements _FileSystemEntityModel {
  _$_FileSystemEntityModel({required this.path});

  factory _$_FileSystemEntityModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileSystemEntityModelFromJson(json);

  @override
  final String path;

  @override
  String toString() {
    return 'FileSystemEntityModel(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileSystemEntityModel &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileSystemEntityModelCopyWith<_$_FileSystemEntityModel> get copyWith =>
      __$$_FileSystemEntityModelCopyWithImpl<_$_FileSystemEntityModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileSystemEntityModelToJson(
      this,
    );
  }
}

abstract class _FileSystemEntityModel implements FileSystemEntityModel {
  factory _FileSystemEntityModel({required final String path}) =
      _$_FileSystemEntityModel;

  factory _FileSystemEntityModel.fromJson(Map<String, dynamic> json) =
      _$_FileSystemEntityModel.fromJson;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_FileSystemEntityModelCopyWith<_$_FileSystemEntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TreeNodeModel _$TreeNodeModelFromJson(Map<String, dynamic> json) {
  return _TreeNodeModel.fromJson(json);
}

/// @nodoc
mixin _$TreeNodeModel {
  List<TreeNodeModel> get children => throw _privateConstructorUsedError;
  FileSystemEntityModel get fileSystemEntityModel =>
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
      {List<TreeNodeModel> children,
      FileSystemEntityModel fileSystemEntityModel});

  $FileSystemEntityModelCopyWith<$Res> get fileSystemEntityModel;
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
    Object? children = null,
    Object? fileSystemEntityModel = null,
  }) {
    return _then(_value.copyWith(
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>,
      fileSystemEntityModel: null == fileSystemEntityModel
          ? _value.fileSystemEntityModel
          : fileSystemEntityModel // ignore: cast_nullable_to_non_nullable
              as FileSystemEntityModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileSystemEntityModelCopyWith<$Res> get fileSystemEntityModel {
    return $FileSystemEntityModelCopyWith<$Res>(_value.fileSystemEntityModel,
        (value) {
      return _then(_value.copyWith(fileSystemEntityModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TreeNodeModelCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$_TreeNodeModelCopyWith(
          _$_TreeNodeModel value, $Res Function(_$_TreeNodeModel) then) =
      __$$_TreeNodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TreeNodeModel> children,
      FileSystemEntityModel fileSystemEntityModel});

  @override
  $FileSystemEntityModelCopyWith<$Res> get fileSystemEntityModel;
}

/// @nodoc
class __$$_TreeNodeModelCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$_TreeNodeModel>
    implements _$$_TreeNodeModelCopyWith<$Res> {
  __$$_TreeNodeModelCopyWithImpl(
      _$_TreeNodeModel _value, $Res Function(_$_TreeNodeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
    Object? fileSystemEntityModel = null,
  }) {
    return _then(_$_TreeNodeModel(
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNodeModel>,
      fileSystemEntityModel: null == fileSystemEntityModel
          ? _value.fileSystemEntityModel
          : fileSystemEntityModel // ignore: cast_nullable_to_non_nullable
              as FileSystemEntityModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TreeNodeModel implements _TreeNodeModel {
  _$_TreeNodeModel(
      {required final List<TreeNodeModel> children,
      required this.fileSystemEntityModel})
      : _children = children;

  factory _$_TreeNodeModel.fromJson(Map<String, dynamic> json) =>
      _$$_TreeNodeModelFromJson(json);

  final List<TreeNodeModel> _children;
  @override
  List<TreeNodeModel> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final FileSystemEntityModel fileSystemEntityModel;

  @override
  String toString() {
    return 'TreeNodeModel(children: $children, fileSystemEntityModel: $fileSystemEntityModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreeNodeModel &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.fileSystemEntityModel, fileSystemEntityModel) ||
                other.fileSystemEntityModel == fileSystemEntityModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_children), fileSystemEntityModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeNodeModelCopyWith<_$_TreeNodeModel> get copyWith =>
      __$$_TreeNodeModelCopyWithImpl<_$_TreeNodeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreeNodeModelToJson(
      this,
    );
  }
}

abstract class _TreeNodeModel implements TreeNodeModel {
  factory _TreeNodeModel(
          {required final List<TreeNodeModel> children,
          required final FileSystemEntityModel fileSystemEntityModel}) =
      _$_TreeNodeModel;

  factory _TreeNodeModel.fromJson(Map<String, dynamic> json) =
      _$_TreeNodeModel.fromJson;

  @override
  List<TreeNodeModel> get children;
  @override
  FileSystemEntityModel get fileSystemEntityModel;
  @override
  @JsonKey(ignore: true)
  _$$_TreeNodeModelCopyWith<_$_TreeNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
