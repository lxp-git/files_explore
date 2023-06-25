import 'dart:convert';

import 'package:mmkv/mmkv.dart';

import '../dto/sftp_server.dart';

class LocalStorageHelper {
  static final MMKV _mmkv = MMKV.defaultMMKV();
  static set sftpServers(List<SftpServer> sftpServers) => _mmkv.encodeString(
      "sftpServers", jsonEncode(sftpServers.map((e) => e.toJson()).toList()));
  static List<SftpServer> get sftpServers =>
      (jsonDecode(_mmkv.decodeString("sftpServers") ?? "[]") as List)
          .map((e) => SftpServer.fromJson(e))
          .toList();
}
