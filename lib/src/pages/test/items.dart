import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import 'rivepod.dart';

// class Items extends ConsumerWidget {
//   const Items({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final node = ref.watch(currentTreeNodeModelProvider);

//     if (node == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     final initialOpenPanelValue = node.children
//         .firstWhereOrNull((TreeNodeModel e) => e.children.isNotEmpty);
//     return ExpansionPanelList(
//       // expandedHeaderPadding: const EdgeInsets.all(0),
//       expansionCallback: (panelIndex, isExpanded) {
//         if (!isExpanded) {
//           ref.read(currentTreeNodeModelProvider.notifier).list(panelIndex);
//         }
//       },
//       expandedHeaderPadding: const EdgeInsets.all(0),
//       children: node.children.map<ExpansionPanel>((TreeNodeModel rootTemp) {
//         final root = rootTemp;
//         print("rootTemp========" + root.children.isNotEmpty.toString());
//         print(rootTemp.children.length);
//         return ExpansionPanel(
//             canTapOnHeader: true,
//             isExpanded: root.children.isNotEmpty,
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return Row(
//                 children: [
//                   Icon(isExpanded
//                       ? Icons.arrow_drop_down_rounded
//                       : Icons.arrow_right_rounded),
//                   Text(root.fileSystemEntityModel.path.replaceFirst(
//                       node.fileSystemEntityModel.path + Platform.pathSeparator,
//                       ""))
//                 ],
//               );
//             },
//             body: ProviderScope(
//               overrides: [
//                 // currentTreeNodeModelProvider.overrideWith((ref) =>
//                 //     TreeNodeModel(
//                 //         children: [],
//                 //         fileSystemEntityModel: FileSystemEntityModel(path: "")))
//                 currentTreeNodeModelProvider.overrideWith(
//                     () => CurrentTreeNodeModel(defaultState: root))
//               ],
//               child: const Items(),
//             ));
//       }).toList(),
//     );
//   }
// }

class Items extends ConsumerWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final node = ref.watch(currentTreeNodeModelProvider);
    if (node == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  ref.read(currentTreeNodeModelProvider.notifier).list();
                },
                child: Row(
                  children: [
                    Icon(node.isExpanded
                        ? Icons.arrow_drop_down_rounded
                        : Icons.arrow_right_rounded),
                    Expanded(
                        child: Text(node.fileSystemEntityModel.path
                            .replaceFirst(
                                (node.parent?.fileSystemEntityModel.path ??
                                        "") +
                                    Platform.pathSeparator,
                                "")))
                  ],
                )),
            ...node.children.map((e) {
              return Column(
                children: [
                  // const Items()
                  ProviderScope(
                    overrides: [
                      currentTreeNodeModelProvider.overrideWith(
                          () => CurrentTreeNodeModel(defaultState: e))
                    ],
                    child: const Items(),
                  )
                ],
              );
            }).toList()
          ],
        ));
  }
}
