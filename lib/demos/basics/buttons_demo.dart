import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';

const _src = "";

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final buttondemo = DemoItem(
  id: "basics_buttons",
  title: "ButtonSSSsss",
  categoryId: "basics",
  categoryTitle: "Basics",
  route: "/demo/basics_buttons",
  tags: const ["basic", "material3"],
  difficulty: Difficulty.easy,
  sourceCode: _src,
  builder: (context) => const DemoScaffold(
    child: ButtonExample(),
    title: "Buttons",
    sourceCode: _src,
  ),
  description: "Material3 normal buttons",
);
