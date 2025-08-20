import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';
import 'package:flutter_ui/utils/showtoast.dart';

const String _src =
    '''
ListView(
      children: [
        Text(
          "Display Large with textTheme.displayLarge",
          style: t.displayLarge,
        ),
        Text(
          "Display This with textTheme.headlineMedium",
          style: t.headlineMedium,
        ),
        Text("Title Large with textTheme.titleLarge", style: t.titleLarge),
        Text("Body Large with textTheme.bodyLarge", style: t.bodyLarge),
        Text("Display This with nothing"),
        Text(
          "Display this with TextStyle fontWeight: FontWeight.bold",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Display this with all TextStyles params",
          style: TextStyle(
            // backgroundColor: Colors.grey,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0,
            wordSpacing: 3.0,
            textBaseline: TextBaseline.alphabetic,
            height: 2,
            leadingDistribution: TextLeadingDistribution.even,
            locale: Locale('en', 'US'),
            background: Paint()..color = Colors.yellow,
            foreground: Paint()..color = Colors.red,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 2),
            ],
            decoration: TextDecoration.overline,
            decorationColor: Colors.blue,
            decorationStyle: TextDecorationStyle.dotted,
          ),
        ),
        Text("Display This with TextAlign.end", textAlign: TextAlign.end),
        Text("Display This with TextAlign.center", textAlign: TextAlign.center),
        Text(
          "Display This with StrutStyle , mainly for print to confirm words in same baseline",
          strutStyle: StrutStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          "Display This with TextDirection.rtl",
          textDirection: TextDirection.rtl,
        ),
        Text(
          "Display This with softWrap: true , but need be longger , like this : ${'*'}",
          softWrap: true,
          style: TextStyle(color: Colors.greenAccent),
        ),
        Text(
          "Display This with softWrap: false , but need be longger , like this : ${'*'}",
          softWrap: false,
          style: TextStyle(color: Colors.green),
        ),
        Text(
          "Display This with TextOverflow.ellipsis :${'#'}",
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "Display This with TextOverflow.clip :${'#'}",
          overflow: TextOverflow.clip,
        ),
        SizedBox(
          height: 20,
          child: Text(
            "Display This with TextOverflow.fade :${'#'}",
            overflow: TextOverflow.fade,
          ),
        ),
        SizedBox(
          height: 20,
          child: Text(
            "Display This with TextOverflow.visible :${'#'}",
            overflow: TextOverflow.visible,
          ),
        ),
        Text("Something is been blocked", textAlign: TextAlign.center),
        Text("Something is been blocked", textAlign: TextAlign.center),
        Text(
          "Display This with TextScaler.linear(1.5)",
          textScaler: TextScaler.linear(1.5),
        ),
        Text(
          "Display This with TextScaler.linear(0.5)",
          textScaler: TextScaler.linear(0.5),
        ),
        Text(
          "Display This with other params , but need longer : ${'9'}",
          textScaler: TextScaler.noScaling,
          maxLines: 3,
          selectionColor: Colors.red,
          semanticsIdentifier: "text-demo-text-scaler-no-scaling",
          semanticsLabel: "OverFlow ellipsis",
        ),
        const Divider(thickness: 3, color: Colors.amberAccent),
        RichText(
          text: TextSpan(
            text:
                "Display Rich Text, don't support const , first text must be InnerSpan(inc : TextSpan and WidgetSpan) , but it's no difference with upper text but impact by default params.",
          ),
        ),
        RichText(
          text: WidgetSpan(child: Text("Display Rich Text with a WidgetSpan ")),
        ),
        RichText(
          text: TextSpan(
            text: "Display Rich Text : TextAlign.end  also with black color",
            style: TextStyle(color: Colors.black),
          ),
          textAlign: TextAlign.end,
        ),
        RichText(
          text: TextSpan(
            text:
                "Display Rich Text : TextDirection.rtl  also with black color",
            style: TextStyle(color: Colors.black),
          ),
          textDirection: TextDirection.rtl,
        ),
        RichText(
          text: TextSpan(
            text:
                "Display Rich Text : softWrap: true also with black color , longer : ${'8'}",
            style: TextStyle(color: Colors.black),
          ),
          softWrap: true,
        ),
        RichText(
          text: TextSpan(
            text: "Display Rich Text",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "2 Span with smaller size and red color ",
                style: TextStyle(fontSize: 5, color: Colors.redAccent),
              ),
              TextSpan(
                text: "3 Span with Larger size and green color ",
                style: TextStyle(fontSize: 50, color: Colors.greenAccent),
              ),
            ],
          ),
        ),
        const Divider(),
        const Text.rich(
          TextSpan(
            text:
                "Display Text.rich with a TextSpan, it will create a RichText but with more default params which don't need input by your self.",
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "This is a "),
              WidgetSpan(
                child: Icon(Icons.favorite, size: 16, color: Colors.red),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(text: " icon embedded in text using WidgetSpan."),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Text.rich You can also embed "),
              WidgetSpan(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'colored boxes',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              const TextSpan(text: " or even "),
              WidgetSpan(
                child: Chip(
                  label: const Text('Chips'),
                  backgroundColor: Colors.greenAccent,
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              const TextSpan(text: " in your text."),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Text.rich Here's a button inside text: "),
              WidgetSpan(
                child: ElevatedButton(
                  onPressed: () {
                    ShowToast.toast(
                      "Yes ,it's a button in RichText",
                      "Widget Span means you can add not text widget inside a text msgline",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    minimumSize: const Size(0, 0),
                  ),
                  child: const Text('Click me', style: TextStyle(fontSize: 12)),
                ),
                alignment: PlaceholderAlignment.middle,
              ),
            ],
          ),
        ),
        const Divider(thickness: 3, color: Colors.black),
        TextField(
          groupId: 'text_demo',
          controller: _firstController,
          decoration: InputDecoration(
            hint: Text('Display TextField1 with This Hint'),
            hintStyle: TextStyle(fontSize: 12, color: Colors.yellowAccent),
            label: Text('TextField1 with This label'),
            labelStyle: TextStyle(fontSize: 14, color: Colors.yellow),
            hintTextDirection: TextDirection.rtl,
            hintFadeDuration: Duration(microseconds: 500),
            alignLabelWithHint: true,
            prefix: Icon(Icons.text_decrease),
            suffix: Icon(Icons.text_fields),
            filled: true,
            fillColor: Colors.teal,
            hoverColor: Colors.tealAccent,
            focusColor: Colors.deepOrange,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
          ),
          keyboardType: TextInputType.datetime,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        TextField(
          groupId: 'text_demo',
          decoration: InputDecoration(hintText: "DIsplay Normal TextField"),
        ),
        const Divider(thickness: 3, color: Colors.cyanAccent),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "TextFormField inside a Form Widget",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                onSaved: (newValue) => {
                  ShowToast.toast("xxx is onSaved"),
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
        const Divider(thickness: 3, color: Colors.deepOrange),
        SelectableText(
          "Diaplay SelectableText , But my flutter 3.32.7 has an issue for ios . so other platform should be ok",
          // showCursor: true,
          // style: TextStyle(fontSize: 20, color: Colors.deepPurple),
          // textAlign: TextAlign.center,
        ),
        const Divider(thickness: 3, color: Colors.deepPurple),
        CupertinoTextField(
          controller: _secondController,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.greenAccent, width: 2),
          ),
          prefix: Text.rich(TextSpan(text: "This is a CupertinoTextField")),
        ),
        const Divider(thickness: 3, color: Colors.greenAccent),
      ],
    );
''';

///Text
///RichText
///Text.rich
///CupertinoText
///
///
///TextField
///TextFormField
///SelectableText
///CupertinoTextField
class TextStylesExample extends StatefulWidget {
  const TextStylesExample({super.key});

  @override
  State<TextStylesExample> createState() => _TextStylesExampleState();
}

class _TextStylesExampleState extends State<TextStylesExample> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _secondController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return ListView(
      children: [
        Text(
          "Display Large with textTheme.displayLarge",
          style: t.displayLarge,
        ),
        Text(
          "Display This with textTheme.headlineMedium",
          style: t.headlineMedium,
        ),
        Text("Title Large with textTheme.titleLarge", style: t.titleLarge),
        Text("Body Large with textTheme.bodyLarge", style: t.bodyLarge),
        Text("Display This with nothing"),
        Text(
          "Display this with TextStyle fontWeight: FontWeight.bold",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Display this with all TextStyles params",
          style: TextStyle(
            // backgroundColor: Colors.grey,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0,
            wordSpacing: 3.0,
            textBaseline: TextBaseline.alphabetic,
            height: 2,
            leadingDistribution: TextLeadingDistribution.even,
            locale: Locale('en', 'US'),
            background: Paint()..color = Colors.yellow,
            foreground: Paint()..color = Colors.red,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 2),
            ],
            decoration: TextDecoration.overline,
            decorationColor: Colors.blue,
            decorationStyle: TextDecorationStyle.dotted,
          ),
        ),
        Text("Display This with TextAlign.end", textAlign: TextAlign.end),
        Text("Display This with TextAlign.center", textAlign: TextAlign.center),
        Text(
          "Display This with StrutStyle , mainly for print to confirm words in same baseline",
          strutStyle: StrutStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          "Display This with TextDirection.rtl",
          textDirection: TextDirection.rtl,
        ),
        Text(
          "Display This with softWrap: true , but need be longger , like this : ${'*' * 100}",
          softWrap: true,
          style: TextStyle(color: Colors.greenAccent),
        ),
        Text(
          "Display This with softWrap: false , but need be longger , like this : ${'*' * 100}",
          softWrap: false,
          style: TextStyle(color: Colors.green),
        ),
        Text(
          "Display This with TextOverflow.ellipsis :${'#' * 200}",
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "Display This with TextOverflow.clip :${'#' * 200}",
          overflow: TextOverflow.clip,
        ),
        SizedBox(
          height: 20,
          child: Text(
            "Display This with TextOverflow.fade :${'#' * 200}",
            overflow: TextOverflow.fade,
          ),
        ),
        SizedBox(
          height: 20,
          child: Text(
            "Display This with TextOverflow.visible :${'#' * 60}",
            overflow: TextOverflow.visible,
          ),
        ),
        Text("Something is been blocked", textAlign: TextAlign.center),
        Text("Something is been blocked", textAlign: TextAlign.center),
        Text(
          "Display This with TextScaler.linear(1.5)",
          textScaler: TextScaler.linear(1.5),
        ),
        Text(
          "Display This with TextScaler.linear(0.5)",
          textScaler: TextScaler.linear(0.5),
        ),
        Text(
          "Display This with other params , but need longer : ${'9' * 120}",
          textScaler: TextScaler.noScaling,
          maxLines: 3,
          selectionColor: Colors.red,
          semanticsIdentifier: "text-demo-text-scaler-no-scaling",
          semanticsLabel: "OverFlow ellipsis",
        ),
        const Divider(thickness: 3, color: Colors.amberAccent),
        RichText(
          text: TextSpan(
            text:
                "Display Rich Text, don't support const , first text must be InnerSpan(inc : TextSpan and WidgetSpan) , but it's no difference with upper text but impact by default params.",
          ),
        ),
        RichText(
          text: WidgetSpan(child: Text("Display Rich Text with a WidgetSpan ")),
        ),
        RichText(
          text: TextSpan(
            text: "Display Rich Text : TextAlign.end  also with black color",
            style: TextStyle(color: Colors.black),
          ),
          textAlign: TextAlign.end,
        ),
        RichText(
          text: TextSpan(
            text:
                "Display Rich Text : TextDirection.rtl  also with black color",
            style: TextStyle(color: Colors.black),
          ),
          textDirection: TextDirection.rtl,
        ),
        RichText(
          text: TextSpan(
            text:
                "Display Rich Text : softWrap: true also with black color , longer : ${'8' * 30}",
            style: TextStyle(color: Colors.black),
          ),
          softWrap: true,
        ),
        RichText(
          text: TextSpan(
            text: "Display Rich Text",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "2 Span with smaller size and red color ",
                style: TextStyle(fontSize: 5, color: Colors.redAccent),
              ),
              TextSpan(
                text: "3 Span with Larger size and green color ",
                style: TextStyle(fontSize: 50, color: Colors.greenAccent),
              ),
            ],
          ),
        ),
        const Divider(),
        const Text.rich(
          TextSpan(
            text:
                "Display Text.rich with a TextSpan, it will create a RichText but with more default params which don't need input by your self.",
          ),
        ),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "This is a "),
              WidgetSpan(
                child: Icon(Icons.favorite, size: 16, color: Colors.red),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(text: " icon embedded in text using WidgetSpan."),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Text.rich You can also embed "),
              WidgetSpan(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'colored boxes',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              const TextSpan(text: " or even "),
              WidgetSpan(
                child: Chip(
                  label: const Text('Chips'),
                  backgroundColor: Colors.greenAccent,
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              const TextSpan(text: " in your text."),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "Text.rich Here's a button inside text: "),
              WidgetSpan(
                child: ElevatedButton(
                  onPressed: () {
                    ShowToast.toast(
                      "Yes ,it's a button in RichText",
                      "Widget Span means you can add not text widget inside a text msgline",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    minimumSize: const Size(0, 0),
                  ),
                  child: const Text('Click me', style: TextStyle(fontSize: 12)),
                ),
                alignment: PlaceholderAlignment.middle,
              ),
            ],
          ),
        ),
        const Divider(thickness: 3, color: Colors.black),
        TextField(
          groupId: 'text_demo',
          controller: _firstController,
          decoration: InputDecoration(
            hint: Text('Display TextField1 with This Hint'),
            hintStyle: TextStyle(fontSize: 12, color: Colors.yellowAccent),
            label: Text('TextField1 with This label'),
            labelStyle: TextStyle(fontSize: 14, color: Colors.yellow),
            hintTextDirection: TextDirection.rtl,
            hintFadeDuration: Duration(microseconds: 500),
            alignLabelWithHint: true,
            prefix: Icon(Icons.text_decrease),
            suffix: Icon(Icons.text_fields),
            filled: true,
            fillColor: Colors.teal,
            hoverColor: Colors.tealAccent,
            focusColor: Colors.deepOrange,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
          ),
          keyboardType: TextInputType.datetime,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
        TextField(
          groupId: 'text_demo',
          decoration: InputDecoration(hintText: "DIsplay Normal TextField"),
        ),
        const Divider(thickness: 3, color: Colors.cyanAccent),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "TextFormField inside a Form Widget",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                onSaved: (newValue) => {
                  ShowToast.toast("$newValue is onSaved"),
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
        const Divider(thickness: 3, color: Colors.deepOrange),
        SelectableText(
          "Diaplay SelectableText , But my flutter 3.32.7 has an issue for ios . so other platform should be ok",
          // showCursor: true,
          // style: TextStyle(fontSize: 20, color: Colors.deepPurple),
          // textAlign: TextAlign.center,
        ),
        const Divider(thickness: 3, color: Colors.deepPurple),
        CupertinoTextField(
          controller: _secondController,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.greenAccent, width: 2),
          ),
          prefix: Text.rich(TextSpan(text: "This is a CupertinoTextField")),
        ),
        const Divider(thickness: 3, color: Colors.greenAccent),
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
