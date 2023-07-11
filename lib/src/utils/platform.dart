import 'package:files_explore/src/dto/android_application.dart';
import 'package:flutter/services.dart';

class PlatformUtils {
  static const methodChannel = MethodChannel("app.pasteshare.flutter/utils");
  static Future<Uint8List?> getApkLogo(String path) async {
    // bytes
    try {
      return await methodChannel.invokeMethod("getApkLogo", {"path": path});
    } catch (error) {
      print("error:" + error.toString());
    }

    return null;
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

  static Future<List<AndroidActivity>> getActivities(String path) async {
    return (await methodChannel
                .invokeMethod<List<dynamic>>('getActivities', {"path": path}))
            ?.map((e) => AndroidActivity.fromJson(Map<String, dynamic>.from(e)))
            .toList() ??
        <AndroidActivity>[];
  }

  static Future<AndroidApplication> getApplicationInfo(String path) async {
    return AndroidApplication.fromJson(Map.from((await methodChannel
        .invokeMethod('getApplicationInfo', {"path": path}))));
  }

  static Future<AndroidActivity> getActivityInfo(
      String packageName, String name) async {
    return AndroidActivity.fromJson(Map.from((await methodChannel.invokeMethod(
        'getActivityInfo', {"packageName": packageName, "name": name}))));
  }

  static Future<String> getExternalStorageDirectory() async {
    return await methodChannel.invokeMethod('getExternalStorageDirectory');
  }
}
