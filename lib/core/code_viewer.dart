import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

Future<void> showCodeSheet(
  BuildContext context, {
  String? sourceCode,
  String? sourceAssets,
}) async {
  debugPrint("Current sourceCode: $sourceCode");
  String content = sourceCode ?? "";
  if (content.isEmpty && sourceAssets != null) {
    try {
      content = await rootBundle.loadString(sourceAssets);
    } catch (e) {
      content = "// Error loading source code $sourceAssets. \n ";
    }
  }

  if (content.isEmpty) content = "// No source code available.";

  if (context.mounted) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return DraggableScrollableSheet(
          builder: (_, controller) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Code',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Copy',
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: content));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Copied to clipboard'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.copy),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        // width: 200,
                        child: SingleChildScrollView(
                          controller: controller,
                          child: Wrap(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                child: HighlightView(
                                  content,
                                  language: 'dart',
                                  theme: githubTheme,
                                  padding: const EdgeInsets.all(8),
                                  textStyle: const TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
