import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';
import 'package:flutter_ui/utils/constantvalue.dart';
import 'package:flutter_ui/utils/showtoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

const _src = "";

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  int count = 0;
  List<bool> isToggleSelected = [false, false, false, false];
  String _dropdownValue = "item0";
  List<Icon> popupMenuIcons = [
    const Icon(Icons.add),
    const Icon(Icons.remove),
    const Icon(Icons.close),
    const Icon(Icons.settings),
  ];
  Widget _selectedIcon = Icon(Icons.add);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: () {
                ShowToast.toast(
                  "FilledButton Used for primary actions which need specific color to stand out.",
                  "Material 3 设计规范推荐使用主题来定义颜色,所以不要自定义颜色，有需要请另写Widget",
                );
              },

              child: const Text("FilledButton"),
            ),
            FilledButton.tonal(
              onPressed: () {
                ShowToast.toast(
                  "FilledButton Tonal Used for low priority actions",
                );
              },
              child: const Text("FilledButton Tonal"),
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                ShowToast.toast(
                  "OutlinedButton TonalIcon Used for low priority actions which has an icon",
                );
              },
              label: const Text("FilledButton TonalIcon"),
              icon: const Icon(FontAwesomeIcons.github),
            ),

            OutlinedButton(
              onPressed: () {
                ShowToast.toast(
                  "OutlinedButton Used for medium priority actions",
                  "Higher than TextButton but lower than FilledButton or ElevatedButton",
                );
              },
              child: const Text("OutlinedButton Maybe : Cancel"),
            ),
            OutlinedButton.icon(
              onPressed: () => ShowToast.toast(
                "OutlinedButton Icon Used for medium priority actions with Icon",
                "Draw attention with the outlined color and icon",
              ),
              label: const Text("OutlinedButton Icon"),
              icon: Icon(FontAwesomeIcons.mobileButton),
            ),
            TextButton(
              onPressed: () => ShowToast.toast(
                "TextButton Used for low priority actions",
                "No Border or Color that's why it's called TextButton",
              ),
              child: const Text("TextButton"),
            ),
            TextButton.icon(
              onPressed: () => ShowToast.toast(
                "TextButton Used for low priority actions",
                "With Icon",
              ),
              label: const Text("TextButton Icon"),
              icon: Icon(FontAwesomeIcons.tabletButton),
            ),
            ElevatedButton(
              onPressed: () => ShowToast.toast(
                "ElevatedButton Used for primary actions",
                "Maybe used for form submission , 3D effects",
              ),
              child: const Text("ElevatedButton"),
            ),
            ElevatedButton.icon(
              onPressed: () => ShowToast.toast("Just with Icon"),
              label: const Text("ElevatedButton.icon"),
              icon: const Icon(FontAwesomeIcons.elevator),
            ),
            IconButton(
              onPressed: () => ShowToast.toast(
                "IconButton Used for actions with icon",
                "Just Icon could be a button , that's the purpose",
              ),
              icon: const Icon(Icons.star),
            ),
            IconButton.filled(
              onPressed: () => ShowToast.toast(
                "IconButton Used for actions with icon",
                "Now with a theme color .",
              ),
              icon: const Icon(Icons.star),
            ),
            IconButton.filledTonal(
              onPressed: () => ShowToast.toast(
                "IconButton Used for actions with icon",
                "Now with a theme color but lower priority",
              ),
              icon: const Icon(Icons.star),
            ),
            IconButton.outlined(
              onPressed: () => ShowToast.toast(
                "IconButton Used for actions with icon",
                "Now you can see it's for medium operations",
              ),
              icon: const Icon(Icons.star),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text("Count : $count"),
        const SizedBox(height: 8),
        FilledButton.icon(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          label: const Text("Add By FilledButton.icon"),
          icon: const Icon(Icons.add),
        ),
        const Divider(),
        ToggleButtons(
          constraints: BoxConstraints(
            minWidth: screenWidth / 5,
            maxWidth: screenWidth / 4,
          ),
          selectedColor: Colors.red,
          fillColor: Colors.red.withAlpha(25),
          isSelected: isToggleSelected,
          onPressed: (index) => setState(() {
            isToggleSelected[index] = !isToggleSelected[index];
          }),
          children: [
            Text("Toggle 1"),
            Text("Toggle 2"),
            Icon(Icons.check),
            Icon(FontAwesomeIcons.toggleOn),
          ],
        ),
        ToggleButtons(
          verticalDirection: VerticalDirection.up,
          direction: Axis.vertical,
          selectedColor: Colors.red,
          fillColor: Colors.red.withAlpha(25),
          isSelected: isToggleSelected,
          onPressed: (index) => setState(() {
            isToggleSelected[index] = !isToggleSelected[index];
          }),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          children: [
            Text("Toggle 3"),
            Text("Toggle 4"),
            Icon(Icons.legend_toggle),
            Icon(FontAwesomeIcons.toggleOff),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Text(_dropdownValue),
            const SizedBox(width: 8),
            DropdownButton<String>(
              icon: const Icon(Icons.arrow_upward),
              iconSize: 16,
              elevation: 6,
              isDense: true,
              isExpanded: false,
              dropdownColor: Colors.greenAccent.shade100,
              value: _dropdownValue,
              items: [
                DropdownMenuItem<String>(
                  value: "item0",
                  child: Text("Drop Down Menu Item 0"),
                ),
                DropdownMenuItem<String>(
                  value: "item1",
                  child: Text("Drop Down Menu Item 1"),
                ),
              ],
              onChanged: (String? newValue) => setState(() {
                _dropdownValue = newValue ?? _dropdownValue;
              }),
            ),
            kConstantSizedBoxH8,
            HintMsgWidget(
              msg:
                  "DropdownButton 是 Flutter 中用于实现下拉选择功能的重要组件，它允许用户从一组选项中选择一个值。通过合理使用其各种属性，可以创建满足不同设计需求的下拉选择器。",
            ),
          ],
        ),
        kConstantSizedBoxH8,
        Row(
          children: [
            Text(_dropdownValue),
            const SizedBox(width: 8),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                value: _dropdownValue,
                decoration: const InputDecoration(
                  labelText: "选择选项",
                  border: OutlineInputBorder(),
                ),
                items: <String>['item0', 'item1'].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue ?? _dropdownValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请选择一个选项';
                  }
                  return null;
                },
              ),
            ),
            kConstantSizedBoxH8,
            HintMsgWidget(
              msg:
                  "DropdownButtonFormField 是 DropdownButton 和 FormField 的组合，专门用于表单中。它将下拉选择功能与表单字段功能结合在一起，可以与表单验证和状态管理无缝集成。",
            ),
          ],
        ),
        kConstantSizedBoxH8,
        Row(
          children: [
            Text(_dropdownValue),
            const SizedBox(width: 8),

            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(Icons.arrow_upward),
                iconSize: 16,
                elevation: 6,
                isDense: true,
                isExpanded: false,
                dropdownColor: Colors.greenAccent.shade100,
                value: _dropdownValue,
                items: [
                  DropdownMenuItem<String>(
                    value: "item0",
                    child: Text("Drop Down Menu Item 0"),
                  ),
                  DropdownMenuItem<String>(
                    value: "item1",
                    child: Text("Drop Down Menu Item 1"),
                  ),
                ],
                onChanged: (String? newValue) => setState(() {
                  _dropdownValue = newValue ?? _dropdownValue;
                }),
              ),
            ),
            kConstantSizedBoxH8,
            HintMsgWidget(
              msg:
                  "DropdownButtonHideUnderline 是一个包装器组件，用于隐藏 DropdownButton 的默认下划线。",
            ),
          ],
        ),
        const Divider(color: Colors.pink),
        PopupMenuButton(
          itemBuilder: (context) {
            return popupMenuIcons
                .map(
                  (e) => PopupMenuItem(
                    onTap: () {
                      setState(() {
                        _selectedIcon = e;
                      });
                    },
                    child: e,
                  ),
                )
                .toList();
          },
          icon: _selectedIcon,
          tooltip: "Popup Menu",
          color: Colors.red.withAlpha(0.3 * 255 ~/ 1),
          iconColor: Colors.amber,
          enableFeedback: true,
          position: PopupMenuPosition.over,
        ),
        const Divider(color: Colors.blue),
        FloatingActionButton(
          onPressed: () {
            ShowToast.toast(
              "FAB用于呈现应用的主要功能或最常用的操作，通常是页面的核心功能。例如，在聊天应用中用于新建消息，在邮件应用中用于撰写新邮件。",
              '''数量限制：Google Material Design指南建议每个屏幕只使用一个FAB，避免造成用户困扰。
位置限制：FAB通常固定在屏幕的特定位置（如右下角），不能随意放置。''',
            );
          },

          shape: CircleBorder(),
          child: Icon(Icons.add_outlined),
        ),

        const Divider(color: Colors.cyan),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BackButton(
              color: Colors.deepOrange,
              onPressed: () => ShowToast.toast(
                "Should go back , but this one only show msg ",
                "which is useful if you need to create a back buttonthat responds differently to being pressed.",
              ),
            ),
            CloseButton(
              color: Colors.greenAccent,
              onPressed: () => ShowToast.toast(
                "Should close , but this one only show msg ",
                "Use a [CloseButton] instead of a [BackButton] on fullscreen dialogs orpages that may solicit additional actions to close.",
              ),
            ),
          ],
        ),
        const Divider(color: Colors.indigo),
        Wrap(
          children: [
            CupertinoButton(
              onPressed: () {
                ShowToast.toast(
                  "This is a IOS style button",
                  "An iOS-style button.Takes in a text or an icon that fades out and in on touch. May optionally have abackground.",
                );
              },
              child: Text("CupertinoButton"),
            ),
            CupertinoButton.filled(
              child: Text("CupertinoButton.filled"),
              onPressed: () {
                ShowToast.toast(
                  "This is a IOS style button",
                  "Creates an iOS-style button with a filled background.",
                );
              },
            ),
            CupertinoButton.tinted(
              child: Text("CupertinoButton.tinted"),
              onPressed: () {
                ShowToast.toast(
                  "This is a IOS style button",
                  "Creates an iOS-style button with a tinted background.",
                );
              },
            ),
          ],
        ),
      ],
    );
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
    title: "Buttons",
    sourceCode: _src,
    child: ButtonExample(),
  ),
  description: "Material3 normal buttons",
);

/// Target : when user click this ,will show helpful msg
class HintMsgWidget extends StatelessWidget {
  final String msg;
  const HintMsgWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ShowToast.toast("Please long press to see hint");
      },
      icon: const Icon(Icons.help_center_outlined),
      tooltip: msg,
    );
  }
}
