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
            titleTextStyle = TextStyle(color: Colors.grey);
          }
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

  showContextMenu(TreeNodeModel node) async {
    ref.read(asyncCurrentTreeNodeModelProvider.notifier).select();
    final width = overlay?.paintBounds.size.width ?? 0;
    final height = overlay?.paintBounds.size.height ?? 0;
    final needSelect = await showMenu(
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
        if (node is TreeNodeFileSystemEntity)
          PopupMenuItem(
            onTap: () {
              CustomClipboard.setData(node);
              // Clipboard.setData(ClipboardData(text: node.toJson().toString()));
            },
            //value: this._index,
            child: Row(
              children: const [Text("Copy")],
            ),
          ),
        if (node is TreeNodeFileSystemEntity)
          PopupMenuItem(
            onTap: () async {
              final clipboardData = CustomClipboard.getData();
              if (clipboardData is TreeNodeFileSystemEntity) {
                clipboardData.fileSystemEntity;
                if (node is TreeNodeFileSystemEntity) {
                  final newPath = node.fileSystemEntity.absolute.path +
                      "/" +
                      basename(clipboardData.fileSystemEntity.absolute.path);
                  // File(newPath).asS final result = await
                  File(clipboardData.fileSystemEntity.absolute.path)
                      .copy(newPath)
                      .asStream()
                      .listen((event) {
                    print(event);
                  });
                }
              }
            },
            //value: this._index,
            child: Row(
              children: const [Text("Paste")],
            ),
          ),
        if (node is TreeNodeFileSystemEntity)
          PopupMenuItem(
            onTap: () {},
            //value: this._index,
            child: Row(
              children: const [Text("Rename")],
            ),
          ),
        if (node is TreeNodeFileSystemEntity)
          PopupMenuItem(
            onTap: () {},
            //value: this._index,
            child: Row(
              children: const [Text("New folder")],
            ),
          ),
        if (node is TreeNodeFileSystemEntity)
          PopupMenuItem(
            onTap: () {
              try {
                File(node.fileSystemEntity.path).deleteSync();
              } catch (error) {}
            },
            //value: this._index,
            child: Row(
              children: const [Text("Delete")],
            ),
          ),
        if (node is TreeNodeAndroidApplication)
          PopupMenuItem(
            onTap: () {
              AndroidIntent intent = AndroidIntent(
                action: "android.settings.APPLICATION_DETAILS_SETTINGS",
                package: node.androidApplication.packageName,
                data: "package:${node.androidApplication.packageName}",
              );
              intent.launch();
            },
            //value: this._index,
            child: Row(
              children: const [Text("App System Info")],
            ),
          ),
        if (node is TreeNodeSftpServer && node.sftpServer.host.isEmpty)
          PopupMenuItem(
            onTap: () {
              showNewSftpServerDialog();
            },
            //value: this._index,
            child: Row(
              children: const [Text("Add")],
            ),
          ),
        if (node is TreeNodeSftpServer && node.sftpServer.host.isNotEmpty)
          PopupMenuItem(
            onTap: () {},
            //value: this._index,
            child: Row(
              children: const [Text("Shell")],
            ),
          ),
      ],
      context: context,
      position: RelativeRect.fromLTRB(
        _tapPosition.dx,
        _tapPosition.dy,
        width - _tapPosition.dx,
        height - _tapPosition.dy,
      ),
    );
    ref.read(asyncCurrentTreeNodeModelProvider.notifier).select();
  }

  showNewSftpServerDialog() {
    final labelTextEditingController = TextEditingController();
    final hostTextEditingController = TextEditingController();
    final pathTextEditingController = TextEditingController();
    final usernameTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();
    final portTextEditingController = TextEditingController(text: "22");
    final privateKeyPath = "";
    showDialog(
        context: context,
        builder: (context) {
          String host = "";
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                  child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('New Server'),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                            child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextField(
                                controller: labelTextEditingController,
                                decoration: const InputDecoration(
                                    filled: true,
                                    hintText: "",
                                    labelText: "Label")),
                            TextField(
                                onChanged: (value) {
                                  setState(() {
                                    host = value;
                                  });
                                },
                                controller: hostTextEditingController,
                                decoration: const InputDecoration(
                                    filled: true,
                                    hintText: "",
                                    labelText: "Host name or ip address")),
                            TextField(
                                controller: pathTextEditingController,
                                decoration: const InputDecoration(
                                    filled: true,
                                    hintText: "",
                                    labelText: "Path")),
                          ],
                        )),
                        SizedBox(width: 10),
                        Flexible(
                            child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextField(
                                controller: usernameTextEditingController,
                                decoration: const InputDecoration(
                                    filled: true,
                                    hintText: "",
                                    labelText: "Username")),
                            TextField(
                                controller: passwordTextEditingController,
                                decoration: const InputDecoration(
                                    filled: true,
                                    hintText: "",
                                    labelText: "Password")),
                            MaterialButton(
                              onPressed: () {},
                              child: Text("Private key"),
                            )
                          ],
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Test'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
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
                          child: const Text('Save'),
                          onPressed: host.isEmpty
                              ? null
                              : () {
                                  LocalStorageHelper.sftpServers = [
                                    ...LocalStorageHelper.sftpServers,
                                    SftpServer(
                                        label: labelTextEditingController.text,
                                        host: hostTextEditingController.text,
                                        username:
                                            usernameTextEditingController.text,
                                        port: int.parse(
                                            portTextEditingController.text),
                                        password:
                                            passwordTextEditingController.text)
                                  ];
                                  Navigator.of(context).pop();
                                },
                        ),
                      ],
                    )
                  ],
                ),
              ));
            },
          );
        });
  }
}
