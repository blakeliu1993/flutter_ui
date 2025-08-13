import 'package:flutter/widgets.dart';

enum Difficulty { easy, medium, hard }

class DemoItem {
  final String id;
  final String title;
  final String categoryId;
  final String categoryTitle;
  final String route;
  final List<String> tags;
  final Difficulty difficulty;
  final WidgetBuilder builder;

  final String? sourceCode;
  final String? sourceAssets;
  final String? description;

  const DemoItem({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.categoryTitle,
    required this.route,
    required this.tags,
    required this.difficulty,
    required this.builder,
    this.sourceCode,
    this.sourceAssets,
    this.description,
  });
}

class DemoCategory {}
