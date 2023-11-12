import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:files_explore/src/dto/sftp_server.dart';
import 'package:files_explore/src/pages/home/rivepod.dart';
import 'package:files_explore/src/utils/custom_clipboard.dart';
import 'package:files_explore/src/utils/local_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/platform.dart';
import 'context_menu.dart';
import 'rivepod.dart';

class CustomSearchHintDelegate extends SearchDelegate<String> {
  CustomSearchHintDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildLeading(BuildContext context) => const Text('leading');

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(56.0), child: Text('bottom'));
  }

  @override
  Widget buildSuggestions(BuildContext context) => const Text('suggestions');

  @override
  Widget buildResults(BuildContext context) => const Text('results');

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[];
}

class Items extends ConsumerWidget {
  late BuildContext context;
  late WidgetRef ref;
  final Animation<double> animation;
  final _buttonKey = GlobalKey();
  RenderObject? overlay;
  Items({super.key, required this.animation});

  // Tap location will be used use to position the context menu
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
    print(_tapPosition);
  }

  @override
  Widget build(BuildContext _, WidgetRef __) {
    context = _;
    ref = __;
    overlay = Overlay.of(context).context.findRenderObject();
    final node = ref.watch(asyncCurrentTreeNodeModelProvider);
    return node.maybeWhen(
      orElse: () => Container(),
      loading: () => Container(),
      data: (node) {
        Widget icon = const Icon(Icons.insert_drive_file_outlined);
        Widget expandedIcon = Icon((node.expanded == TreeExpanded.ok)
            ? Icons.arrow_drop_down_rounded
            : Icons.arrow_right_rounded);

        String title = "";
        TextStyle? titleTextStyle = Theme.of(context).textTheme.bodyMedium;
        var path = "";
        if (node is TreeNodeFileSystemEntity) {
          path = node.fileSystemEntity.path;
          if (!FileSystemEntity.isDirectorySync(node.fileSystemEntity.path)) {
            expandedIcon = const SizedBox(width: 0);
          } else {
            icon = const Icon(Icons.folder_outlined);
          }
          if (FileSystemEntity.isDirectorySync(node.fileSystemEntity.path)) {
          } else if (path.toLowerCase().endsWith(".zip")) {
            icon = const Icon(Icons.folder_zip_outlined);
          } else if (path.toLowerCase().endsWith(".crt")) {
            icon = const Icon(Icons.security_outlined);
          } else if (path.toLowerCase().endsWith(".apk")) {
            icon = SizedBox(
              child: FutureBuilder(
                future: PlatformUtils.getApkLogo(path),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(strokeWidth: 2);
                  }
                  return Image.memory(snapshot.data!, width: 20, height: 20);
                },
              ),
              width: 20,
              height: 20,
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
          title = path.replaceFirst(
              ((node.parent as TreeNodeFileSystemEntity?)
                          ?.fileSystemEntity
                          .path ??
                      "") +
                  Platform.pathSeparator,
              "");
          if (title.startsWith(".")) {
            titleTextStyle = const TextStyle(color: Colors.grey);
          }
        } else if (node is TreeNodeAndroidApplication) {
          path = node.androidApplication.label;
          icon = const Icon(Icons.android_outlined);
          title = node.androidApplication.label +
              (node.androidApplication.enabled ? "" : " (Disabled)");
          if (path.isNotEmpty && node.parent != null) {
            icon = SizedBox(
              width: 20,
              height: 20,
              child: FutureBuilder(
                future: Future.delayed(
                    const Duration(seconds: 2),
                    () => PlatformUtils.getApkLogo(
                        node.androidApplication.packageName)),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(strokeWidth: 2);
                  }
                  return Image.memory(snapshot.data!, width: 20, height: 20);
                },
              ),
            );
          }
        } else if (node is TreeNodeAndroidActivity) {
          path = node.androidActivity.name;
          icon = const Icon(Icons.android_outlined);
          title = node.androidActivity.name +
              (node.androidActivity.enabled ? "" : " (Disabled)");
        } else if (node is TreeNodeSftpServer) {
          path = node.sftpServer.host.isEmpty
              ? node.sftpServer.label!
              : node.sftpServer.host;
          icon = const Icon(Icons.cloud_circle_outlined);
          title = node.sftpServer.label!.isEmpty
              ? node.sftpServer.host
              : node.sftpServer.label!;
        } else if (node is TreeNodeSftpName) {
          path = node.sftpName.longname;
          icon = const Icon(Icons.cloud_circle_outlined);
          title = node.sftpName.filename;
        }
        if (node.expanded == TreeExpanded.loading) {
          expandedIcon = Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(4),
              child: CircularProgressIndicator(strokeWidth: 2));
        }

        final content = InkWell(
            key: _buttonKey,
            onLongPress: () {
              showContextMenu(
                  context: context,
                  node: node,
                  overlay: overlay,
                  ref: ref,
                  tapPosition: _tapPosition);
            },
            onTapDown: _getTapPosition,
            onTap: () {
              if (node is TreeNodeFileSystemEntity) {
                if (path.endsWith(".apk")) {
                  PlatformUtils.installApk(path);
                  return;
                }
                if (FileSystemEntity.isDirectorySync(path)) {
                  ref.read(asyncCurrentTreeNodeModelProvider.notifier).list();
                  return;
                }
                PlatformUtils.openFile(path);
                return;
              }
              ref.read(asyncCurrentTreeNodeModelProvider.notifier).list();
            },
            child: Container(
                color: (node is TreeNodeFileSystemEntity &&
                        node.selected != null &&
                        node.selected!)
                    ? Theme.of(context).focusColor
                    : Colors.transparent,
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    expandedIcon,
                    icon,
                    const SizedBox(width: 4),
                    Expanded(child: Text(title, style: titleTextStyle))
                  ],
                )));
        return Padding(
            padding: EdgeInsets.only(left: node.parent == null ? 0 : 16),
            child: Column(
              children: [
                if (path.isNotEmpty)
                  FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                          sizeFactor: animation, child: content)),
                AnimatedList(
                  key: ref
                      .read(asyncCurrentTreeNodeModelProvider.notifier)
                      .listKey,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  initialItemCount: node.children?.length ?? 0,
                  itemBuilder: (context, index, animation) {
                    return ProviderScope(
                      overrides: [
                        asyncCurrentTreeNodeModelProvider.overrideWith(() =>
                            AsyncCurrentTreeNodeModel(
                                defaultState: node.children?[index],
                                sftpClient: ref
                                    .read(asyncCurrentTreeNodeModelProvider
                                        .notifier)
                                    .sftpClient))
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
