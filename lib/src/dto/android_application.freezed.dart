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
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AndroidApplicationCopyWith<$Res>
    implements $AndroidApplicationCopyWith<$Res> {
  factory _$$_AndroidApplicationCopyWith(_$_AndroidApplication value,
          $Res Function(_$_AndroidApplication) then) =
      __$$_AndroidApplicationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      String packageName,
      List<AndroidActivity>? activities,
      bool enabled});
}

/// @nodoc
class __$$_AndroidApplicationCopyWithImpl<$Res>
    extends _$AndroidApplicationCopyWithImpl<$Res, _$_AndroidApplication>
    implements _$$_AndroidApplicationCopyWith<$Res> {
  __$$_AndroidApplicationCopyWithImpl(
      _$_AndroidApplication _value, $Res Function(_$_AndroidApplication) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? packageName = null,
    Object? activities = freezed,
    Object? enabled = null,
  }) {
    return _then(_$_AndroidApplication(
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
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AndroidApplication implements _AndroidApplication {
  _$_AndroidApplication(
      {required this.label,
      required this.packageName,
      required final List<AndroidActivity>? activities,
      required this.enabled})
      : _activities = activities;

  factory _$_AndroidApplication.fromJson(Map<String, dynamic> json) =>
      _$$_AndroidApplicationFromJson(json);

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

  @override
  final bool enabled;

  @override
  String toString() {
    return 'AndroidApplication(label: $label, packageName: $packageName, activities: $activities, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AndroidApplication &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, packageName,
      const DeepCollectionEquality().hash(_activities), enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AndroidApplicationCopyWith<_$_AndroidApplication> get copyWith =>
      __$$_AndroidApplicationCopyWithImpl<_$_AndroidApplication>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AndroidApplicationToJson(
      this,
    );
  }
}

abstract class _AndroidApplication implements AndroidApplication {
  factory _AndroidApplication(
      {required final String label,
      required final String packageName,
      required final List<AndroidActivity>? activities,
      required final bool enabled}) = _$_AndroidApplication;

  factory _AndroidApplication.fromJson(Map<String, dynamic> json) =
      _$_AndroidApplication.fromJson;

  @override
  String get label;
  @override
  String get packageName;
  @override
  List<AndroidActivity>? get activities;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$_AndroidApplicationCopyWith<_$_AndroidApplication> get copyWith =>
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
abstract class _$$_AndroidActivityCopyWith<$Res>
    implements $AndroidActivityCopyWith<$Res> {
  factory _$$_AndroidActivityCopyWith(
          _$_AndroidActivity value, $Res Function(_$_AndroidActivity) then) =
      __$$_AndroidActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool enabled, String? packageName});
}

/// @nodoc
class __$$_AndroidActivityCopyWithImpl<$Res>
    extends _$AndroidActivityCopyWithImpl<$Res, _$_AndroidActivity>
    implements _$$_AndroidActivityCopyWith<$Res> {
  __$$_AndroidActivityCopyWithImpl(
      _$_AndroidActivity _value, $Res Function(_$_AndroidActivity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? enabled = null,
    Object? packageName = freezed,
  }) {
    return _then(_$_AndroidActivity(
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
class _$_AndroidActivity implements _AndroidActivity {
  _$_AndroidActivity(
      {required this.name, required this.enabled, required this.packageName});

  factory _$_AndroidActivity.fromJson(Map<String, dynamic> json) =>
      _$$_AndroidActivityFromJson(json);

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
            other is _$_AndroidActivity &&
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
  _$$_AndroidActivityCopyWith<_$_AndroidActivity> get copyWith =>
      __$$_AndroidActivityCopyWithImpl<_$_AndroidActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AndroidActivityToJson(
      this,
    );
  }
}

abstract class _AndroidActivity implements AndroidActivity {
  factory _AndroidActivity(
      {required final String name,
      required final bool enabled,
      required final String? packageName}) = _$_AndroidActivity;

  factory _AndroidActivity.fromJson(Map<String, dynamic> json) =
      _$_AndroidActivity.fromJson;

  @override
  String get name;
  @override
  bool get enabled;
  @override
  String? get packageName;
  @override
  @JsonKey(ignore: true)
  _$$_AndroidActivityCopyWith<_$_AndroidActivity> get copyWith =>
      throw _privateConstructorUsedError;
}
