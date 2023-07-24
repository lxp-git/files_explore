import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:files_explore/src/dto/sftp_server.dart';
import 'package:files_explore/src/utils/custom_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';

import 'rivepod.dart';

showContextMenu(
    {required context,
    required TreeNodeModel node,
    required overlay,
    required ref,
    required tapPosition}) async {
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
          showSearchDialog(context, node, ref);
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
          onTap: () async {
            Share.shareXFiles([XFile(node.fileSystemEntity.path)]);
          },
          //value: this._index,
          child: Row(
            children: const [Text("Share")],
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
          child: const Row(
            children: [Text("New folder")],
          ),
        ),
      if (node is TreeNodeFileSystemEntity || node is TreeNodeSftpServer)
        PopupMenuItem(
          onTap: () {
            ref.read(asyncCurrentTreeNodeModelProvider.notifier).delete();
          },
          //value: this._index,
          child: const Row(
            children: [Text("Delete")],
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
          child: const Row(
            children: [Text("App System Info")],
          ),
        ),
      if (node is TreeNodeSftpServer && node.sftpServer.host.isEmpty)
        PopupMenuItem(
          onTap: () {
            showNewSftpServerDialog(context, ref);
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
      tapPosition.dx,
      tapPosition.dy,
      width - tapPosition.dx,
      height - tapPosition.dy,
    ),
  );
  ref.read(asyncCurrentTreeNodeModelProvider.notifier).select();
}

showNewSftpServerDialog(context, ref) {
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
                                final hostAndPort =
                                    hostTextEditingController.text.split(":");
                                int? port = int.tryParse(hostAndPort[1]);
                                ref
                                    .read(asyncCurrentTreeNodeModelProvider
                                        .notifier)
                                    .insert(
                                        sftpServer:
                                            SftpServer(
                                                id:
                                                    DateTime.now()
                                                        .millisecondsSinceEpoch,
                                                label:
                                                    labelTextEditingController
                                                        .text,
                                                host: hostAndPort[0],
                                                username:
                                                    usernameTextEditingController
                                                        .text,
                                                port: port ?? 22,
                                                password:
                                                    passwordTextEditingController
                                                        .text));
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

showSearchDialog(BuildContext context, TreeNodeModel node, ref) {
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
