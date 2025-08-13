import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';

const _src = "";

class TextStylesExample extends StatelessWidget {
  const TextStylesExample({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return ListView(
      children: [
        Text("Display Large", style: t.displayLarge),
        Text("Headling Medium", style: t.headlineMedium),
        Text("Title Large", style: t.titleLarge),
        Text("Body Large", style: t.bodyLarge),
        const Divider(),
        const Text(
          "OverFlow ellipsis",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        const Text.rich(
          TextSpan(
            text: "rich",
            children: [
              TextSpan(
                text: "text",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "RICH",
                style: TextStyle(color: Colors.teal),
              ),
            ],
          ),
        ),
      ],
    );
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
    title: "Text Styles",
    sourceCode: _src,
    child: TextStylesExample(),
  ),
);
