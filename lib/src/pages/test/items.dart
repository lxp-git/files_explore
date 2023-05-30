import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

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
        return Padding(
            padding: EdgeInsets.only(left: node.parent == null ? 0 : 4),
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
                            ref
                                .read(
                                    asyncCurrentTreeNodeModelProvider.notifier)
                                .list();
                          },
                          child: Row(
                            children: [
                              Icon(node.isExpanded
                                  ? Icons.arrow_drop_down_rounded
                                  : Icons.arrow_right_rounded),
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
