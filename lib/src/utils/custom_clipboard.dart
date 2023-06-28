import 'package:files_explore/src/pages/home/rivepod.dart';

class CustomClipboard {
  static TreeNodeModel? nodeModel = null;

  static setData(TreeNodeModel nodeModel) {
    CustomClipboard.nodeModel = nodeModel;
  }

  static getData() {
    return nodeModel;
  }
}
