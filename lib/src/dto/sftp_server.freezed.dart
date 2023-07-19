// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sftp_server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SftpServer _$SftpServerFromJson(Map<String, dynamic> json) {
  return _SftpServer.fromJson(json);
}

/// @nodoc
mixin _$SftpServer {
  int get id => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get privateKeyFile => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SftpServerCopyWith<SftpServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SftpServerCopyWith<$Res> {
  factory $SftpServerCopyWith(
          SftpServer value, $Res Function(SftpServer) then) =
      _$SftpServerCopyWithImpl<$Res, SftpServer>;
  @useResult
  $Res call(
      {int id,
      String host,
      int port,
      String username,
      String? password,
      String? privateKeyFile,
      String? label});
}

/// @nodoc
class _$SftpServerCopyWithImpl<$Res, $Val extends SftpServer>
    implements $SftpServerCopyWith<$Res> {
  _$SftpServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = freezed,
    Object? privateKeyFile = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      privateKeyFile: freezed == privateKeyFile
          ? _value.privateKeyFile
          : privateKeyFile // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SftpServerCopyWith<$Res>
    implements $SftpServerCopyWith<$Res> {
  factory _$$_SftpServerCopyWith(
          _$_SftpServer value, $Res Function(_$_SftpServer) then) =
      __$$_SftpServerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String host,
      int port,
      String username,
      String? password,
      String? privateKeyFile,
      String? label});
}

/// @nodoc
class __$$_SftpServerCopyWithImpl<$Res>
    extends _$SftpServerCopyWithImpl<$Res, _$_SftpServer>
    implements _$$_SftpServerCopyWith<$Res> {
  __$$_SftpServerCopyWithImpl(
      _$_SftpServer _value, $Res Function(_$_SftpServer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = freezed,
    Object? privateKeyFile = freezed,
    Object? label = freezed,
  }) {
    return _then(_$_SftpServer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      privateKeyFile: freezed == privateKeyFile
          ? _value.privateKeyFile
          : privateKeyFile // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SftpServer implements _SftpServer {
  _$_SftpServer(
      {required this.id,
      required this.host,
      this.port = 22,
      required this.username,
      this.password,
      this.privateKeyFile,
      this.label});

  factory _$_SftpServer.fromJson(Map<String, dynamic> json) =>
      _$$_SftpServerFromJson(json);

  @override
  final int id;
  @override
  final String host;
  @override
  @JsonKey()
  final int port;
  @override
  final String username;
  @override
  final String? password;
  @override
  final String? privateKeyFile;
  @override
  final String? label;

  @override
  String toString() {
    return 'SftpServer(id: $id, host: $host, port: $port, username: $username, password: $password, privateKeyFile: $privateKeyFile, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SftpServer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.privateKeyFile, privateKeyFile) ||
                other.privateKeyFile == privateKeyFile) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, host, port, username, password, privateKeyFile, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SftpServerCopyWith<_$_SftpServer> get copyWith =>
      __$$_SftpServerCopyWithImpl<_$_SftpServer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SftpServerToJson(
      this,
    );
  }
}

abstract class _SftpServer implements SftpServer {
  factory _SftpServer(
      {required final int id,
      required final String host,
      final int port,
      required final String username,
      final String? password,
      final String? privateKeyFile,
      final String? label}) = _$_SftpServer;

  factory _SftpServer.fromJson(Map<String, dynamic> json) =
      _$_SftpServer.fromJson;

  @override
  int get id;
  @override
  String get host;
  @override
  int get port;
  @override
  String get username;
  @override
  String? get password;
  @override
  String? get privateKeyFile;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$_SftpServerCopyWith<_$_SftpServer> get copyWith =>
      throw _privateConstructorUsedError;
}
