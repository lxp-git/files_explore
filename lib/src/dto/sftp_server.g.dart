// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sftp_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SftpServerImpl _$$SftpServerImplFromJson(Map<String, dynamic> json) =>
    _$SftpServerImpl(
      id: json['id'] as int,
      host: json['host'] as String,
      port: json['port'] as int? ?? 22,
      username: json['username'] as String,
      password: json['password'] as String?,
      privateKeyFile: json['privateKeyFile'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$SftpServerImplToJson(_$SftpServerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host,
      'port': instance.port,
      'username': instance.username,
      'password': instance.password,
      'privateKeyFile': instance.privateKeyFile,
      'label': instance.label,
    };
