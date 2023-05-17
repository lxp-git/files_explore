import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'rivepod.dart';

class Items extends ConsumerWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final node = ref.watch(currentTreeNodeModelProvider);

    return ExpansionPanelList.radio(
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (panelIndex, isExpanded) {
        if (!isExpanded) {
          ref.read(homeProvider.notifier).list(node.children[panelIndex]);
        }
      },
      children: node.children.map<ExpansionPanelRadio>((TreeNodeModel root) {
        print("root.fileSystemEntityModel.path:" +
            root.fileSystemEntityModel.path);
        return ExpansionPanelRadio(
            canTapOnHeader: true,
            value: root.fileSystemEntityModel.path,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Row(
                children: [
                  const Icon(Icons.arrow_right_rounded),
                  Text(root.fileSystemEntityModel.path.replaceFirst(
                      node.fileSystemEntityModel.path + Platform.pathSeparator,
                      ""))
                ],
              );
            },
            body: ProviderScope(
              overrides: [
                currentTreeNodeModelProvider.overrideWith((ref) => root)
              ],
              child: const Items(),
            ));
      }).toList(),
    );
  }
}
