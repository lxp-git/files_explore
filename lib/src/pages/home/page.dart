import 'dart:io';

import 'package:files_explore/src/pages/home/items.dart';
import 'package:files_explore/src/pages/home/rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class Home extends ConsumerWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeNodeModel = ref.watch(homeProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: treeNodeModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                child: SingleChildScrollView(
                    child: ProviderScope(
                  overrides: [
                    currentTreeNodeModelProvider
                        .overrideWith((ref) => treeNodeModel)
                  ],
                  child: Items(),
                )),
                onRefresh: () async {
                  await ref.read(homeProvider.notifier).init();
                },
              ),
      ),
    );
  }
}
