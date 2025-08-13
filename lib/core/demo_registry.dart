import 'package:flutter_ui/core/demo_models.dart';
import '../demos/basics/text_demo.dart';
import '../demos/basics/buttons_demo.dart';

final List<DemoItem> allDemos = [textDemo, buttondemo];

DemoItem? findDemoById(String id) {
  try {
    return allDemos.firstWhere((e) => e.id == id);
  } catch (e) {
    return null;
  }
}
