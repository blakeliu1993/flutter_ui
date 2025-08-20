import 'package:flutter_ui/core/demo_models.dart';
import '../demos/basics/text_demo.dart';
import '../demos/basics/buttons_demo.dart';
import '../demos/effects/liquidglass.dart';
import '../demos/effects/future_ui_paint.dart';
import '../demos/basics/chip_demo.dart';

final List<DemoItem> allDemos = [
  textDemo,
  buttondemo,
  chipDemo,
  // liquidglassdemo,
  // futureUiPaintDemo,
];

DemoItem? findDemoById(String id) {
  try {
    return allDemos.firstWhere((e) => e.id == id);
  } catch (e) {
    return null;
  }
}
