// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'android_application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AndroidApplication _$AndroidApplicationFromJson(Map<String, dynamic> json) {
  return _AndroidApplication.fromJson(json);
}

/// @nodoc
mixin _$AndroidApplication {
  String get label => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  List<AndroidActivity>? get activities => throw _privateConstructorUsedError;
  @FileSystemEntityListJSONConverter()
  List<FileSystemEntity>? get files => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AndroidApplicationCopyWith<AndroidApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidApplicationCopyWith<$Res> {
  factory $AndroidApplicationCopyWith(
          AndroidApplication value, $Res Function(AndroidApplication) then) =
      _$AndroidApplicationCopyWithImpl<$Res, AndroidApplication>;
  @useResult
  $Res call(
      {String label,
      String packageName,
      List<AndroidActivity>? activities,
      @FileSystemEntityListJSONConverter() List<FileSystemEntity>? files,
      bool enabled});
}

/// @nodoc
class _$AndroidApplicationCopyWithImpl<$Res, $Val extends AndroidApplication>
    implements $AndroidApplicationCopyWith<$Res> {
  _$AndroidApplicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? packageName = null,
    Object? activities = freezed,
    Object? files = freezed,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<AndroidActivity>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileSystemEntity>?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidApplicationImplCopyWith<$Res>
    implements $AndroidApplicationCopyWith<$Res> {
  factory _$$AndroidApplicationImplCopyWith(_$AndroidApplicationImpl value,
          $Res Function(_$AndroidApplicationImpl) then) =
      __$$AndroidApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      String packageName,
      List<AndroidActivity>? activities,
      @FileSystemEntityListJSONConverter() List<FileSystemEntity>? files,
      bool enabled});
}

/// @nodoc
class __$$AndroidApplicationImplCopyWithImpl<$Res>
    extends _$AndroidApplicationCopyWithImpl<$Res, _$AndroidApplicationImpl>
    implements _$$AndroidApplicationImplCopyWith<$Res> {
  __$$AndroidApplicationImplCopyWithImpl(_$AndroidApplicationImpl _value,
      $Res Function(_$AndroidApplicationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? packageName = null,
    Object? activities = freezed,
    Object? files = freezed,
    Object? enabled = null,
  }) {
    return _then(_$AndroidApplicationImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      activities: freezed == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<AndroidActivity>?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileSystemEntity>?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndroidApplicationImpl implements _AndroidApplication {
  _$AndroidApplicationImpl(
      {required this.label,
      required this.packageName,
      required final List<AndroidActivity>? activities,
      @FileSystemEntityListJSONConverter()
      required final List<FileSystemEntity>? files,
      required this.enabled})
      : _activities = activities,
        _files = files;

  factory _$AndroidApplicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AndroidApplicationImplFromJson(json);

  @override
  final String label;
  @override
  final String packageName;
  final List<AndroidActivity>? _activities;
  @override
  List<AndroidActivity>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FileSystemEntity>? _files;
  @override
  @FileSystemEntityListJSONConverter()
  List<FileSystemEntity>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool enabled;

  @override
  String toString() {
    return 'AndroidApplication(label: $label, packageName: $packageName, activities: $activities, files: $files, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidApplicationImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      label,
      packageName,
      const DeepCollectionEquality().hash(_activities),
      const DeepCollectionEquality().hash(_files),
      enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidApplicationImplCopyWith<_$AndroidApplicationImpl> get copyWith =>
      __$$AndroidApplicationImplCopyWithImpl<_$AndroidApplicationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AndroidApplicationImplToJson(
      this,
    );
  }
}

abstract class _AndroidApplication implements AndroidApplication {
  factory _AndroidApplication(
      {required final String label,
      required final String packageName,
      required final List<AndroidActivity>? activities,
      @FileSystemEntityListJSONConverter()
      required final List<FileSystemEntity>? files,
      required final bool enabled}) = _$AndroidApplicationImpl;

  factory _AndroidApplication.fromJson(Map<String, dynamic> json) =
      _$AndroidApplicationImpl.fromJson;

  @override
  String get label;
  @override
  String get packageName;
  @override
  List<AndroidActivity>? get activities;
  @override
  @FileSystemEntityListJSONConverter()
  List<FileSystemEntity>? get files;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$AndroidApplicationImplCopyWith<_$AndroidApplicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AndroidActivity _$AndroidActivityFromJson(Map<String, dynamic> json) {
  return _AndroidActivity.fromJson(json);
}

/// @nodoc
mixin _$AndroidActivity {
  String get name => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AndroidActivityCopyWith<AndroidActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidActivityCopyWith<$Res> {
  factory $AndroidActivityCopyWith(
          AndroidActivity value, $Res Function(AndroidActivity) then) =
      _$AndroidActivityCopyWithImpl<$Res, AndroidActivity>;
  @useResult
  $Res call({String name, bool enabled, String? packageName});
}

/// @nodoc
class _$AndroidActivityCopyWithImpl<$Res, $Val extends AndroidActivity>
    implements $AndroidActivityCopyWith<$Res> {
  _$AndroidActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? enabled = null,
    Object? packageName = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidActivityImplCopyWith<$Res>
    implements $AndroidActivityCopyWith<$Res> {
  factory _$$AndroidActivityImplCopyWith(_$AndroidActivityImpl value,
          $Res Function(_$AndroidActivityImpl) then) =
      __$$AndroidActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool enabled, String? packageName});
}

/// @nodoc
class __$$AndroidActivityImplCopyWithImpl<$Res>
    extends _$AndroidActivityCopyWithImpl<$Res, _$AndroidActivityImpl>
    implements _$$AndroidActivityImplCopyWith<$Res> {
  __$$AndroidActivityImplCopyWithImpl(
      _$AndroidActivityImpl _value, $Res Function(_$AndroidActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? enabled = null,
    Object? packageName = freezed,
  }) {
    return _then(_$AndroidActivityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndroidActivityImpl implements _AndroidActivity {
  _$AndroidActivityImpl(
      {required this.name, required this.enabled, required this.packageName});

  factory _$AndroidActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AndroidActivityImplFromJson(json);

  @override
  final String name;
  @override
  final bool enabled;
  @override
  final String? packageName;

  @override
  String toString() {
    return 'AndroidActivity(name: $name, enabled: $enabled, packageName: $packageName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidActivityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, enabled, packageName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidActivityImplCopyWith<_$AndroidActivityImpl> get copyWith =>
      __$$AndroidActivityImplCopyWithImpl<_$AndroidActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AndroidActivityImplToJson(
      this,
    );
  }
}

abstract class _AndroidActivity implements AndroidActivity {
  factory _AndroidActivity(
      {required final String name,
      required final bool enabled,
      required final String? packageName}) = _$AndroidActivityImpl;

  factory _AndroidActivity.fromJson(Map<String, dynamic> json) =
      _$AndroidActivityImpl.fromJson;

  @override
  String get name;
  @override
  bool get enabled;
  @override
  String? get packageName;
  @override
  @JsonKey(ignore: true)
  _$$AndroidActivityImplCopyWith<_$AndroidActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
