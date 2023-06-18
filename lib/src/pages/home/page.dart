import 'dart:io';

import 'items.dart';
import 'rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: RefreshIndicator(
          child: SingleChildScrollView(
              child: Items(animation: kAlwaysCompleteAnimation)),
          onRefresh: () async {
            await ref.read(asyncCurrentTreeNodeModelProvider.notifier).init();
          },
        ),
      ),
    );
  }
}
