import 'dart:io';

import 'items.dart';
import 'rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class TestHome extends ConsumerWidget {
  TestHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeNodeModel = ref.watch(currentTreeNodeModelProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: treeNodeModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                child: SingleChildScrollView(child: Items()),
                onRefresh: () async {
                  await ref.read(currentTreeNodeModelProvider.notifier).init();
                },
              ),
      ),
    );
  }
}
