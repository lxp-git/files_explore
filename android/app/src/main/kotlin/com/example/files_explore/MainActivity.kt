package com.example.files_explore

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.ActivityInfo
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.Settings
import android.webkit.MimeTypeMap
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.io.File


class MainActivity : FlutterActivity() {
    private val CHANNEL = "app.pasteshare.flutter/utils"
    private val REQUEST_INSTALL_PERMISSION = 100

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getApkLogo") {
                val applicationInfo: ApplicationInfo = getApplicationInfo(call, PackageManager.GET_META_DATA)
                val drawable = applicationInfo.loadIcon(packageManager)
                val stream = ByteArrayOutputStream()
                Thread {
                    convertToBitmap(drawable, 192, 192)!!.compress(Bitmap.CompressFormat.PNG, 100, stream)
                    val image = stream.toByteArray()
                    result.success(image)
                }.start()
            } else if (call.method == "installApk") {
                // 替换为您要安装的APK文件的路径
                val apkFilePath = call.argument<String>("path")!!

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    // Android 8.0及更高版本需要请求安装未知来源应用的权限
                    val hasInstallPermission = packageManager.canRequestPackageInstalls()
                    if (!hasInstallPermission) {
                        // 请求权限
                        val intent = Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:$packageName"))
                        startActivityForResult(intent, REQUEST_INSTALL_PERMISSION)
                    } else {
                        installApk(apkFilePath)
                    }
                } else {
                    installApk(apkFilePath)
                }
            } else if (call.method == "openFile") {
                val filePath = call.argument<String>("path")!!
                val intent = Intent(Intent.ACTION_VIEW)
                intent.setDataAndType(uriFromFile(this, File(filePath)), MimeTypeMap.getSingleton().getMimeTypeFromExtension(MimeTypeMap.getFileExtensionFromUrl(filePath)))
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                intent.addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                startActivity(intent)
            } else if (call.method == "getInstalledApplications") {
                val applicationInfoList: List<ApplicationInfo> = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    packageManager.getInstalledApplications(PackageManager.ApplicationInfoFlags.of(PackageManager.GET_META_DATA.toLong()))
                } else {
                    packageManager.getInstalledApplications(PackageManager.GET_UNINSTALLED_PACKAGES)
                }
                val applicationInfoListMap = applicationInfoList.map {
                    mapOf<String, Any?>("name" to it.name, "packageName" to it.packageName, "label" to it.loadLabel(packageManager), "enabled" to it.enabled)
                }
                result.success(applicationInfoListMap)
            } else if (call.method == "getApplicationInfo") {
                val applicationInfo = getApplicationInfo(call, PackageManager.GET_META_DATA)
                result.success(mapOf<String, Any?>("name" to applicationInfo.name, "packageName" to applicationInfo.packageName, "label" to applicationInfo.loadLabel(packageManager), "enabled" to applicationInfo.enabled))
            } else if (call.method == "getActivities") {
                val apkFilePath = call.argument<String>("path")!!
                val activities: Array<ActivityInfo>? = if (!apkFilePath.startsWith("/")) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        packageManager.getPackageInfo(apkFilePath, PackageManager.PackageInfoFlags.of((PackageManager.GET_ACTIVITIES or PackageManager.MATCH_DISABLED_COMPONENTS).toLong())).activities
                    } else {
                        packageManager.getPackageInfo(apkFilePath, PackageManager.GET_ACTIVITIES or PackageManager.MATCH_DISABLED_COMPONENTS)!!.activities
                    }
                } else {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        packageManager.getPackageArchiveInfo(apkFilePath, PackageManager.PackageInfoFlags.of(PackageManager.GET_ACTIVITIES.toLong()))!!.activities
                    } else {
                        packageManager.getPackageArchiveInfo(apkFilePath, PackageManager.GET_ACTIVITIES)!!.activities
                    }
                }
                result.success(activities?.map {
                    val state = packageManager.getComponentEnabledSetting(ComponentName(it.packageName, it.name))
                    if (it.name == "com.gskinner.flutter.wonders.MainActivity") {
                        print(it.name)
                    }
                    mapOf("enabled" to (state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED && state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER), "name" to it.name)
                }?.toList()
                )
            } else if (call.method == "getActivityInfo") {
                val apkFilePath = call.argument<String>("packageName")!!
                val name = call.argument<String>("name")!!
                val state = packageManager.getComponentEnabledSetting(ComponentName(apkFilePath, name))
                val activities: Array<ActivityInfo>? = if (!apkFilePath.startsWith("/")) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        packageManager.getPackageInfo(apkFilePath, PackageManager.PackageInfoFlags.of((PackageManager.GET_ACTIVITIES or PackageManager.MATCH_DISABLED_COMPONENTS or PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER).toLong())).activities
                    } else {
                        packageManager.getPackageInfo(apkFilePath, PackageManager.GET_ACTIVITIES or PackageManager.MATCH_DISABLED_COMPONENTS)!!.activities
                    }
                } else {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        packageManager.getPackageArchiveInfo(apkFilePath, PackageManager.PackageInfoFlags.of(PackageManager.GET_ACTIVITIES.toLong()))!!.activities
                    } else {
                        packageManager.getPackageArchiveInfo(apkFilePath, PackageManager.GET_ACTIVITIES)!!.activities
                    }
                }
                result.success(activities?.find { it.name == name }?.let {
                    mapOf("enabled" to (state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED && state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER), "name" to it.name)
                })
            } else if (call.method == "setComponentEnabledSetting") {
                val packageName = call.argument<String>("packageName")!!
                val name = call.argument<String>("name")!!
                val state = packageManager.getComponentEnabledSetting(ComponentName(packageName, name))
                if (state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED && state != PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER) {
                    packageManager.setComponentEnabledSetting(ComponentName(packageName, name), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.SYNCHRONOUS)
                }
                result.success(state)
            } else if (call.method == "getExternalStorageDirectory") {
                result.success(Environment.getExternalStorageDirectory().absolutePath)
            } else {
                result.notImplemented()
            }
        }
    }

    fun uriFromFile(context: Context?, file: File?): Uri? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            FileProvider.getUriForFile(context!!, BuildConfig.APPLICATION_ID + ".provider", file!!)
        } else {
            Uri.fromFile(file)
        }
    }

    private fun installApk(apkFilePath: String) {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.setDataAndType(uriFromFile(this, File(apkFilePath)), "application/vnd.android.package-archive")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        intent.addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
        startActivity(intent)
    }

    fun convertToBitmap(drawable: Drawable, widthPixels: Int, heightPixels: Int): Bitmap? {
        val mutableBitmap = Bitmap.createBitmap(widthPixels, heightPixels, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(mutableBitmap)
        drawable.setBounds(0, 0, widthPixels, heightPixels)
        drawable.draw(canvas)
        return mutableBitmap
    }

    fun getApplicationInfo(call: MethodCall, flags: Int): ApplicationInfo {
        val apkFilePath = call.argument<String>("path")!!
        val applicationInfo: ApplicationInfo
        if (!apkFilePath.startsWith("/")) {
            applicationInfo = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                packageManager.getApplicationInfo(apkFilePath, PackageManager.ApplicationInfoFlags.of(flags.toLong()))
            } else {
                packageManager.getApplicationInfo(apkFilePath, flags)
            }
        } else {
            applicationInfo = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                packageManager.getPackageArchiveInfo(apkFilePath, PackageManager.PackageInfoFlags.of(flags.toLong()))!!.applicationInfo
            } else {
                packageManager.getApplicationInfo(apkFilePath, flags)
            }
            applicationInfo.sourceDir = apkFilePath;
            applicationInfo.publicSourceDir = apkFilePath;
        }
        return applicationInfo
    }
}
