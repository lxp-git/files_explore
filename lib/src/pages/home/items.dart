import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:files_explore/src/pages/home/rivepod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/platform.dart';
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
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _tapPosition = referenceBox.globalToLocal(details.globalPosition);
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
        Widget icon = const Icon(Icons.question_mark_outlined);
        Widget expandedIcon = Icon((node.expanded == TreeExpanded.ok)
            ? Icons.arrow_drop_down_rounded
            : Icons.arrow_right_rounded);

        String title = "";
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
                    return const CircularProgressIndicator(strokeWidth: 10);
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
        } else if (node is TreeNodeAndroidApplication) {
          path = node.androidApplication.label;
          icon = const Icon(Icons.android_outlined);
          title = node.androidApplication.label +
              (node.androidApplication.enabled ? "" : " (Disabled)");
          if (path.isNotEmpty && node.parent != null) {
            icon = SizedBox(
              child: FutureBuilder(
                future: Future.delayed(
                    Duration(seconds: 2),
                    () => PlatformUtils.getApkLogo(
                        node.androidApplication.packageName)),
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
          }
        } else if (node is TreeNodeAndroidActivity) {
          path = node.androidActivity.name;
          icon = const Icon(Icons.android_outlined);
          title = node.androidActivity.name +
              (node.androidActivity.enabled ? "" : " (Disabled)");
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
              showContextMenu(node);
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
              } else if (node is TreeNodeAndroidApplication) {
                ref.read(asyncCurrentTreeNodeModelProvider.notifier).list();
              }
            },
            child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    expandedIcon,
                    icon,
                    const SizedBox(width: 4),
                    Expanded(child: Text(title))
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
                                defaultState: node.children?[index]))
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

  showSearchDialog(TreeNodeModel node) {
    final keywordTextEditingController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Search'),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  TextField(controller: keywordTextEditingController),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Search'),
                onPressed: () {
                  Navigator.of(context).pop();
                  ref
                      .read(asyncCurrentTreeNodeModelProvider.notifier)
                      .search(keywordTextEditingController.text);
                },
              ),
            ],
          );
        });
  }

  showContextMenu(TreeNodeModel node) {
    showMenu(
      items: <PopupMenuEntry>[
        if (node is TreeNodeAndroidApplication &&
            node.androidApplication.packageName.isNotEmpty)
          PopupMenuItem(
            //value: this._index,
            child: Row(
              children: [
                Text(node.androidApplication.enabled ? 'Disable' : "Enable")
              ],
            ),
            onTap: () {
              ref
                  .read(asyncCurrentTreeNodeModelProvider.notifier)
                  .disableOrEnableIt();
            },
          ),
        if (node is TreeNodeAndroidActivity &&
            node.androidActivity.name.isNotEmpty)
          PopupMenuItem(
            //value: this._index,
            child: Row(
              children: [
                Text(node.androidActivity.enabled ? 'Disable' : "Enable")
              ],
            ),
            onTap: () {
              ref
                  .read(asyncCurrentTreeNodeModelProvider.notifier)
                  .disableOrEnableIt();
            },
          ),
        PopupMenuItem(
          //value: this._index,
          child: Row(
            children: const [Text("Find")],
          ),
          onTap: () {
            showSearchDialog(node);
          },
        ),
        PopupMenuItem(
          onTap: () {
            if (node is TreeNodeAndroidApplication) {
              AndroidIntent intent = AndroidIntent(
                action: "android.settings.APPLICATION_DETAILS_SETTINGS",
                package: node.androidApplication.packageName,
                data: "package:${node.androidApplication.packageName}",
              );
              intent.launch();
            }
          },
          //value: this._index,
          child: Row(
            children: const [Text("App System Info")],
          ),
        )
      ],
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay?.paintBounds.size.width ?? 0,
              overlay?.paintBounds.size.height ?? 0)),
    );
  }
}
