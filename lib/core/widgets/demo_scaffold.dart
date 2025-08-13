import 'package:flutter/material.dart';
import 'package:flutter_ui/core/code_viewer.dart';

class DemoScaffold extends StatelessWidget {
  final String title;
  final String? description;
  final String? sourceCode;
  final String? sourceAssets;
  final Widget child;
  const DemoScaffold({
    super.key,
    required this.child,
    required this.title,
    this.description,
    this.sourceCode,
    this.sourceAssets,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => showCodeSheet(
              context,
              sourceCode: sourceCode,
              sourceAssets: sourceAssets,
            ),
            icon: const Icon(Icons.code),
            tooltip: 'View Code',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null) ...[
              Text(description!, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 12),
            ],
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
