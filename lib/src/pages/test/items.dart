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
  final Animation<double> animation;
  final _buttonKey = GlobalKey();
  Items({super.key, required this.animation});

  // Tap location will be used use to position the context menu
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _tapPosition = referenceBox.globalToLocal(details.globalPosition);
  }

  @override
  Widget build(BuildContext _, WidgetRef ref) {
    context = _;
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
            icon = FutureBuilder(
              future: PlatformUtils.getApkLogo(path),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(strokeWidth: 10);
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
          title = node.androidApplication.label;
          if (path.isNotEmpty && node.parent != null) {
            icon = FutureBuilder(
              future:
                  PlatformUtils.getApkLogo(node.androidApplication.packageName),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(strokeWidth: 10);
                }
                return Image.memory(snapshot.data!, width: 20, height: 20);
              },
            );
          }
        }
        if (node.expanded == TreeExpanded.loading) {
          expandedIcon = Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(4),
              child: CircularProgressIndicator(strokeWidth: 2));
        }
        final RenderObject? overlay =
            Overlay.of(context).context.findRenderObject();
        final content = InkWell(
            key: _buttonKey,
            onLongPress: () {
              showMenu(
                items: <PopupMenuEntry>[
                  PopupMenuItem(
                    //value: this._index,
                    child: Row(
                      children: const [Text("Find")],
                    ),
                    onTap: () {
                      // showSearch(
                      //     context: context,
                      //     delegate: CustomSearchHintDelegate(
                      //         hintText: "text"));
                      final keywordTextEditingController =
                          TextEditingController();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Search'),
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    TextField(
                                        controller:
                                            keywordTextEditingController),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Disable'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Enable'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    ref
                                        .read(asyncCurrentTreeNodeModelProvider
                                            .notifier)
                                        .search(
                                            keywordTextEditingController.text);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  PopupMenuItem(
                    onTap: () {
                      if (node is TreeNodeAndroidApplication) {
                        AndroidIntent intent = AndroidIntent(
                          action:
                              "android.settings.APPLICATION_DETAILS_SETTINGS",
                          package: node.androidApplication.packageName,
                          data:
                              "package:${node.androidApplication.packageName}",
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
                    Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                        overlay.paintBounds.size.height)),
              );
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
            // padding: const EdgeInsets.all(0),
            // minWidth: 0,
            // height: 0,
            // onPressed: () {
            //   if (node is TreeNodeFileSystemEntity) {
            //     if (path.endsWith(".apk")) {
            //       PlatformUtils.installApk(path);
            //       return;
            //     }
            //     if (FileSystemEntity.isDirectorySync(path)) {
            //       ref
            //           .read(asyncCurrentTreeNodeModelProvider
            //               .notifier)
            //           .list();
            //       return;
            //     }
            //     PlatformUtils.openFile(path);
            //   } else if (node is TreeNodeAndroidApplication) {
            //     ref
            //         .read(asyncCurrentTreeNodeModelProvider
            //             .notifier)
            //         .list();
            //   }
            // },
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
        animation.addListener(() {
          print("animation:" + animation.value.toString());
        });
        return Padding(
            padding: EdgeInsets.only(left: node.parent == null ? 0 : 16),
            child: Column(
              children: [
                if (path.isNotEmpty)
                  FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                          sizeFactor: animation, child: content)), //
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
}
