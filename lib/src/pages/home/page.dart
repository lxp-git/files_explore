import 'dart:io';

import 'package:files_explore/src/pages/home/rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(homeProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (context, index) {
              final file = files[index];
              return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                  leading: Icon(Icons.arrow_right_rounded),
                  title: Text(file.fileSystemEntity.path));
            },
            separatorBuilder: (context, index) {
              return Container();
            },
            itemCount: files.length),
      ),
    );
  }
}
