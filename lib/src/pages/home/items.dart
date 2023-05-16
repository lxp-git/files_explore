// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'rivepod.dart';

// class Item extends ConsumerWidget {
//   late WidgetRef widgetRef;
//   Item({super.key});

//   ExpansionPanelList buildList(TreeNodeModel parent) {
//     return ExpansionPanelList.radio(
//       expandedHeaderPadding: EdgeInsets.all(0),
//       expansionCallback: (panelIndex, isExpanded) {
//         if (isExpanded) {
//           widgetRef
//               .read(homeProvider.notifier)
//               .list(parent.children[panelIndex]);
//         }
//       },
//       children: parent.children.map<ExpansionPanelRadio>((TreeNodeModel root) {
//         return ExpansionPanelRadio(
//             canTapOnHeader: false,
//             value: root.fileSystemEntityModel.path,
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return Container(
//                 // padding: EdgeInsets.only(left: 16),
//                 child: ListTile(
//                     contentPadding: const EdgeInsets.all(0),
//                     minVerticalPadding: 0,
//                     horizontalTitleGap: 0,
//                     minLeadingWidth: 0,
//                     isThreeLine: false,
//                     enableFeedback: true,
//                     style: ListTileTheme.of(context).style,
//                     leading: const Icon(Icons.arrow_right_rounded),
//                     title: Text(root.fileSystemEntityModel.path.replaceFirst(
//                         parent.fileSystemEntityModel.path +
//                             Platform.pathSeparator,
//                         ""))),
//               );
//             },
//             body: ProviderScope(child: buildList(root)));
//       }).toList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     widgetRef = ref;
//     final files = ref.watch(homeProvider);

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(child: buildList(files)),
//       ),
//     );
//   }
// }
