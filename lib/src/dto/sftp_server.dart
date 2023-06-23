import 'package:freezed_annotation/freezed_annotation.dart';

part "sftp_server.g.dart";
part "sftp_server.freezed.dart";

@freezed
class SftpServer with _$SftpServer {
  factory SftpServer(
      {required String host,
      @Default(22) int port,
      required String username,
      String? password,
      String? privateKeyFile,
      String? label}) = _SftpServer;
  factory SftpServer.fromJson(Map<String, dynamic> json) =>
      _$SftpServerFromJson(json);
}
