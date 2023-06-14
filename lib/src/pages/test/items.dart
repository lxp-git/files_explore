import 'dart:io';

import 'package:android_package_manager/android_package_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/platform.dart';
import 'rivepod.dart';

class Items extends ConsumerWidget {
  final Animation<double> animation;
  const Items({super.key, required this.animation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final node = ref.watch(asyncCurrentTreeNodeModelProvider);
    return node.maybeWhen(
      orElse: () => Container(),
      loading: () => Container(),
      data: (node) {
        final path = node.fileSystemEntityModel.path;
        Widget icon = Icon(Icons.question_mark_outlined);
        bool? isExpanded = null;
        Widget expandedIcon = Icon(node.isExpanded
            ? Icons.arrow_drop_down_rounded
            : Icons.arrow_right_rounded);
        if (!node.isDirectory) {
          expandedIcon = SizedBox(width: 0);
        } else {
          icon = Icon(Icons.folder_outlined);
        }
        if (FileSystemEntity.isDirectorySync(node.fileSystemEntityModel.path)) {
        } else if (path.toLowerCase().endsWith(".zip")) {
          icon = Icon(Icons.folder_zip_outlined);
        } else if (path.toLowerCase().endsWith(".crt")) {
          icon = Icon(Icons.security_outlined);
        } else if (path.toLowerCase().endsWith(".apk")) {
          icon = FutureBuilder(
            future: PlatformUtils.getApkLogo(path),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator(strokeWidth: 10);
              }
              return Image.memory(snapshot.data!, width: 20, height: 20);
            },
          );
        } else if (path.toLowerCase().endsWith(".png") ||
            path.toLowerCase().endsWith(".jpg") ||
            path.toLowerCase().endsWith(".jpeg") ||
            path.toLowerCase().endsWith(".gif") ||
            path.toLowerCase().endsWith(".webp")) {
          icon = Container(
            width: 40,
            height: 40,
            color: Colors.grey,
            child: Image(
              image: FileImage(File(path)),
            ),
          );
        }
        return Padding(
            padding: EdgeInsets.only(left: node.parent == null ? 0 : 16),
            child: Column(
              children: [
                if (node.fileSystemEntityModel.path.isNotEmpty)
                  SizeTransition(
                      sizeFactor: animation,
                      child: MaterialButton(
                          padding: const EdgeInsets.all(0),
                          minWidth: 0,
                          height: 0,
                          onPressed: () {
                            if (path.endsWith(".apk")) {
                              PlatformUtils.installApk(path);
                              return;
                            }
                            if (node.isDirectory) {
                              ref
                                  .read(asyncCurrentTreeNodeModelProvider
                                      .notifier)
                                  .list();
                              return;
                            }
                            PlatformUtils.openFile(path);
                          },
                          child: Row(
                            children: [
                              expandedIcon,
                              icon,
                              SizedBox(width: 4),
                              Expanded(
                                  child: Text(node.fileSystemEntityModel.path
                                      .replaceFirst(
                                          (node.parent?.fileSystemEntityModel
                                                      .path ??
                                                  "") +
                                              Platform.pathSeparator,
                                          "")))
                            ],
                          ))),
                AnimatedList(
                  key: ref
                      .read(asyncCurrentTreeNodeModelProvider.notifier)
                      .listKey,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  initialItemCount: node.children.length,
                  itemBuilder: (context, index, animation) {
                    return ProviderScope(
                      overrides: [
                        asyncCurrentTreeNodeModelProvider.overrideWith(() =>
                            AsyncCurrentTreeNodeModel(
                                defaultState: node.children[index]))
                      ],
                      child: Items(animation: animation),
                    );
                  },
                ),
              ],
            ));
      },
    );
  }
}
