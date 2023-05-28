import 'dart:io';

import 'items.dart';
import 'rivepod.dart';
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
                        .overrideWithValue(treeNodeModel)
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
