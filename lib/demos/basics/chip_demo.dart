import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';
import 'package:flutter_ui/utils/showtoast.dart';

const _sourceCode = '''''';

class ChipListWidget extends StatefulWidget {
  const ChipListWidget({super.key});

  @override
  State<ChipListWidget> createState() => _ChipListWidgetState();
}

class _ChipListWidgetState extends State<ChipListWidget> {
  FocusNode focusNode = FocusNode();
  bool inputChipSelected = false;
  bool filterChipSelected = false;
  List<bool> filterChipList = [true, false, true, false, true];
  List<String> filterChipLabels = [
    'Filter 1',
    'Filter 2',
    'Filter 3',
    'Filter 4',
    'Filter 5',
  ];
  bool actionChipSelected = false;
  int selectedChoiceChipIndex = -1;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        ShowToast.toast("Chip 获得了焦点");
      } else {
        ShowToast.toast("Chip 失去了焦点");
      }
    });
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Wrap(
          spacing: 8,
          clipBehavior: Clip.none, // Avoid clipping shadows
          children: [
            Chip(label: const Text('Basic Chip')),
            Chip(
              label: const Text('Basic Chip with CircleAvatar'),
              avatar: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
            ),
            Chip(
              label: const Text('Basic Chip with backgroundcolor'),
              backgroundColor: Colors.amber,
            ),
            Chip(
              label: Text(
                'Basic Chip with clipBehavior: Clip.hardEdge , so ${"1" * 20}',
              ),
              clipBehavior: Clip.hardEdge,
            ),
            Chip(
              label: const Text("Basic Chip with Color , any diff with BGC?"),
              color: WidgetStatePropertyAll(Colors.blue),
            ),
            Chip(
              label: const Text("Basic Chip with deleteIcon & onDeleted"),
              deleteIcon: Icon(Icons.remove_outlined),
              onDeleted: () {
                focusNode.unfocus();
                ShowToast.toast(
                  "Chip delete must have both deleteIcon and onDelted",
                  "1. DeleteIcon is on the right side of the chip",
                );
              },
              deleteIconColor: Colors.blueAccent,
              deleteIconBoxConstraints: const BoxConstraints(
                minWidth: 5,
                minHeight: 5,
                maxHeight: 10,
                maxWidth: 10,
              ),
            ),
            Chip(
              label: const Text("Basic Chip with focusNode , but how ?"),
              focusNode: focusNode,
            ),
            Chip(
              label: const Text("Basic Chip with iconTheme"),
              avatar: const CircleAvatar(
                child: Icon(Icons.check, color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.red),
            ),
            Chip(
              label: const Text("Basic Chip with label params"),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              labelStyle: const TextStyle(color: Colors.brown, fontSize: 22),
            ),
            Chip(
              label: const Text("Basic Chip with padding"),
              padding: const EdgeInsets.all(8),
            ),
            Chip(
              label: const Text(
                "Basic Chip with shape and side to show border",
              ),
              shape: OvalBorder(),
              side: const BorderSide(color: Colors.red, width: 2),
            ),
            Chip(
              label: const Text(
                "Basic Chip with VisualDensity.maximumDensity , but not too much results",
              ),
              visualDensity: VisualDensity(
                horizontal: VisualDensity.maximumDensity,
                vertical: VisualDensity.maximumDensity,
              ),
              avatar: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.check, color: Colors.white),
              ),
            ),
            Chip(
              label: const Text(
                "Basic Chip with elevation and shadowColor surfaceTintColor",
              ),
              elevation: 4,
              shadowColor: Colors.blueGrey,
              surfaceTintColor: Colors.greenAccent,
            ),
          ],
        ),

        const Divider(color: Colors.green, thickness: 3),
        Wrap(
          children: [
            InputChip(label: const Text('Basic Input Chip')),
            InputChip(
              label: const Text('Basic Input Chip params like Chip'),
              avatar: const CircleAvatar(child: Text('B')),
              avatarBorder: CircleBorder(eccentricity: 0.2),
              backgroundColor: Colors.cyan,
              clipBehavior: Clip.antiAlias,
              color: WidgetStatePropertyAll(Colors.cyanAccent),
              deleteIcon: const Icon(Icons.close),
              deleteIconColor: Colors.deepOrange,
              deleteIconBoxConstraints: const BoxConstraints(
                minWidth: 5,
                minHeight: 5,
                maxHeight: 10,
                maxWidth: 10,
              ),

              elevation: 2,
              focusNode: focusNode,
              iconTheme: const IconThemeData(color: Colors.red),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              labelStyle: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 22,
              ),
              onDeleted: () {
                focusNode.unfocus();
                ShowToast.toast(
                  "InputChip delete must have both deleteIcon and onDelted",
                  "1. DeleteIcon is on the right side of the chip",
                );
              },
              padding: const EdgeInsets.all(8),
              shadowColor: Colors.deepPurpleAccent,
              side: const BorderSide(color: Colors.green, width: 2),
              surfaceTintColor: Colors.greenAccent,
              tooltip: "InputChip with tooltip",
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            InputChip(
              label: const Text("Basic Input Chip but disabled"),
              disabledColor: Colors.deepOrangeAccent,
              isEnabled: false,
            ),
            InputChip(
              label: const Text("Basic Input Chip with selected checkmark"),
              checkmarkColor: Colors.lightGreen,
              showCheckmark: true,
              selected: true,
            ),
            InputChip(
              label: const Text("Basic Input Chip with unselected checkmark"),
              checkmarkColor: Colors.lightGreen,
              showCheckmark: true,
              selected: false,
            ),
            InputChip(
              label: const Text("Basic Input Chip with onselected"),
              checkmarkColor: Colors.lightGreen,
              showCheckmark: true,
              selected: inputChipSelected,
              onSelected: (value) {
                if (mounted) {
                  setState(() {
                    inputChipSelected = value;
                  });
                }
              },
              selectedColor: Colors.blueGrey,
              selectedShadowColor: Colors.lightGreenAccent,
              elevation: 2,
              pressElevation: 12,
            ),
            InputChip(
              label: const Text("Input Chip with onpressed"),
              onPressed: () => {
                ShowToast.toast(
                  "Input Chip onPressed",
                  "Provied a method to interact with the chip",
                ),
              },
              elevation: 5,
              pressElevation: 1,
              shadowColor: Colors.indigo,
            ),
          ],
        ),
        const Divider(color: Colors.red, thickness: 4),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(label: const Text('Basic Choice Chip'), selected: false),
            ChoiceChip.elevated(
              label: const Text('Elevated Choice Chip'),
              selected: inputChipSelected,
              onSelected: (value) => {
                if (mounted)
                  {
                    setState(() {
                      inputChipSelected = value;
                    }),
                  },
              },
            ),
            ChoiceChip(
              label: const Text('Basic Choice Chip with almost same params'),
              selected: inputChipSelected,
              onSelected: (value) => {
                if (mounted)
                  {
                    setState(() {
                      inputChipSelected = value;
                    }),
                  },
              },

              avatar: const CircleAvatar(child: Text('B')),
              avatarBorder: CircleBorder(),
              backgroundColor: Colors.cyan,
              clipBehavior: Clip.antiAlias,
              color: WidgetStatePropertyAll(Colors.cyanAccent),

              elevation: 2,
              focusNode: focusNode,
              iconTheme: const IconThemeData(color: Colors.red),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              labelStyle: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 22,
                textBaseline: TextBaseline.alphabetic,
              ),
              padding: const EdgeInsets.all(8),
              shadowColor: Colors.deepPurpleAccent,
              side: const BorderSide(color: Colors.green, width: 2),
              surfaceTintColor: Colors.greenAccent,
              tooltip: "InputChip with tooltip",
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),

            ...List.generate(3, (index) {
              return ChoiceChip(
                label: Text('Generated Chip $index'),
                selected: selectedChoiceChipIndex == index,
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      selectedChoiceChipIndex = selected ? index : -1;
                    });
                  }
                },
                chipAnimationStyle: ChipAnimationStyle(
                  enableAnimation: AnimationStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  selectAnimation: AnimationStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  deleteDrawerAnimation: AnimationStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  avatarDrawerAnimation: AnimationStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                ),
              );
            }),
          ],
        ),
        const Divider(),
        Wrap(
          spacing: 8,
          children: [
            FilterChip(
              label: const Text('Filter Chip unselected'),
              selected: false,
              onSelected: (selected) {},
            ),
            FilterChip.elevated(
              label: const Text("Filter Chip.elevated selected"),
              selected: filterChipSelected,
              onSelected: (selected) {
                setState(() {
                  filterChipSelected = selected;
                });
              },
            ),

            ...List.generate(filterChipList.length, (index) {
              return FilterChip(
                label: Text(filterChipLabels[index]),
                selected: filterChipList[index],
                onSelected: (selected) {
                  setState(() {
                    filterChipList[index] = selected;
                  });
                  ShowToast.toast(
                    "FilterChip is more suitable for multi choise.",
                  );
                },
              );
            }),
          ],
        ),

        const Divider(),
        ActionChip(
          label: const Text('Action Chip is alternative for ElevatedButton'),
        ),
        ActionChip.elevated(
          label: const Text('Action Chip.elevated'),
          onPressed: () {
            setState(() {
              actionChipSelected = !actionChipSelected;
            });
            ShowToast.toast(
              "ActionChip is more suitable for single choice.",
              "Another way to show a btn",
            );
          },
        ),
      ],
    );
  }
}

final chipDemo = DemoItem(
  id: 'chipdemos',
  title: 'Chip',
  categoryId: "basics",
  categoryTitle: "Basics",
  route: "/demo/chipdemos",
  tags: ["Chip", "Material"],
  difficulty: Difficulty.easy,
  sourceCode: _sourceCode,
  description: 'A material design chip.',
  builder: (context) => DemoScaffold(
    title: "Chip Demos",
    sourceCode: _sourceCode,
    child: const ChipListWidget(),
  ),
);
