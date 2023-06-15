import 'package:files_explore/src/dto/android_application.dart';
import 'package:flutter/services.dart';

class PlatformUtils {
  static const methodChannel = MethodChannel("app.pasteshare.flutter/utils");
  static Future<Uint8List> getApkLogo(String path) async {
    // bytes
    return await methodChannel.invokeMethod("getApkLogo", {"path": path});
  }

  static Future<dynamic> installApk(String path) async {
    return await methodChannel.invokeMethod("installApk", {"path": path});
  }

  static Future<dynamic> openFile(String path) async {
    return await methodChannel.invokeMethod("openFile", {"path": path});
  }

  static Future<List<AndroidApplication>> getInstalledApplications() async {
    final List<dynamic>? installedApplications = await methodChannel
        .invokeMethod<List<dynamic>>('getInstalledApplications');
    return installedApplications
            ?.map((e) =>
                AndroidApplication.fromJson(Map<String, dynamic>.from(e)))
            .toList() ??
        <AndroidApplication>[];
  }
}
