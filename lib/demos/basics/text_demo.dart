import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';

const _src = "";

class TextStylesExample extends StatelessWidget {
  const TextStylesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final textDemo = DemoItem(
  id: "basics_text",
  title: "Text Styles",
  categoryId: "basics",
  categoryTitle: "Basics",
  route: "/demo/basics_text",
  tags: const ['basic', 'typography'],
  difficulty: Difficulty.easy,
  sourceCode: _src,
  description: "Show Material 3 text styles",
  builder: (context) => const DemoScaffold(
    child: TextStylesExample(),
    title: "Text Styles",
    sourceCode: _src,
  ),
);
