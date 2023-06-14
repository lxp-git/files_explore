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
  $Res call({String label});
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
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String label});
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
  }) {
    return _then(_$_AndroidApplication(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AndroidApplication implements _AndroidApplication {
  _$_AndroidApplication({required this.label});

  factory _$_AndroidApplication.fromJson(Map<String, dynamic> json) =>
      _$$_AndroidApplicationFromJson(json);

  @override
  final String label;

  @override
  String toString() {
    return 'AndroidApplication(label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AndroidApplication &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label);

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
  factory _AndroidApplication({required final String label}) =
      _$_AndroidApplication;

  factory _AndroidApplication.fromJson(Map<String, dynamic> json) =
      _$_AndroidApplication.fromJson;

  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$_AndroidApplicationCopyWith<_$_AndroidApplication> get copyWith =>
      throw _privateConstructorUsedError;
}
