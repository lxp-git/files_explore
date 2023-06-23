import 'dart:convert';

import 'package:mmkv/mmkv.dart';

import '../dto/sftp_server.dart';

class LocalStorageHelper {
  static MMKV mmkv = MMKV.defaultMMKV();
  static set sftpServers(List<SftpServer> sftpServers) =>
      mmkv.encodeString("sftpServers", jsonEncode(sftpServers));
  static List<SftpServer> get sftpServers =>
      (jsonDecode(mmkv.decodeString("sftpServers") ?? "") as List)
          .map((e) => SftpServer.fromJson(e))
          .toList();
}
