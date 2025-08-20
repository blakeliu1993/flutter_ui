import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';
import 'package:flutter_ui/demos/effects/widget/glass_showcase_background.dart';
import 'package:flutter_ui/utils/constantvalue.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class LiquidDemoWidget extends StatelessWidget {
  const LiquidDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      // // Add background color to show the effect
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.black,
        //     Color(0xff0000ff),
        //     Color(0xff00ff00),
        //     Color(0xff00ffff),
        //     Color(0xffff0000),
        //     Color(0xffff00ff),
        //     Color(0xffffff00),
        //     Colors.white,
        //   ],
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        // ),
        image: DecorationImage(
          image: AssetImage("assets/images/cake-3669245_640.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      // fit: StackFit.expand,
      // children: [
      //   const GlassShowcaseBackground(
      //     animate: true,
      //     bokehCount: 25,
      //     blobOpacity: 0.9,
      //     addGrain: true,
      //     grainOpacity: 0.03,
      //   ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: screenWidth * 0.3,
                child: Text(buildDemoList[index].runtimeType.toString()),
              ),
              Icon(Icons.star_border_outlined, color: Colors.red),
              Draggable(
                feedback: Transform.scale(
                  scale: 1.05,
                  child: buildDemoList[index],
                ),
                childWhenDragging: buildDemoList[index],
                child: buildDemoList[index],
              ),
              Icon(Icons.star_half_outlined, color: Colors.red),
            ],
          );
        },
        separatorBuilder: (context, index) {
          if (index <= buildDemoList.length) {
            return const Divider(thickness: 2, color: Colors.green);
          } else {
            return kConstantSizedBoxH8;
          }
        },
        itemCount: buildDemoList.length,
      ), // ],
    );
  }
}

class Glass6BlurryContainer extends StatelessWidget {
  final double screenWidth;
  const Glass6BlurryContainer({super.key, required this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 5,
      width: screenWidth,
      height: 40,
      elevation: 2,
      color: Colors.transparent,
      padding: const EdgeInsets.all(8),
      child: Container(color: Colors.white.withAlpha(0.1 * 255 ~/ 1)),
    );
  }
}

class Glass5SelfWidget extends StatelessWidget {
  final double screenWidth;
  const Glass5SelfWidget({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.5),
        border: Border.all(color: Colors.black.withAlpha(125), width: 0.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.white.withAlpha(0.8 * 255 ~/ 1),
          ),
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withAlpha(0.25 * 255 ~/ 1),
          ),
        ],
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32.5),
            ),
          ),
        ),
      ),
    );
  }
}

class Glass4ContainerShadownWidget extends StatelessWidget {
  final double screenWidth;
  const Glass4ContainerShadownWidget({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: screenWidth,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withAlpha(50), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white.withAlpha(75),
            child: Text("???"),
          ),
        ),
      ),
    );
  }
}

class Glass3CardBackdropWidget extends StatelessWidget {
  final String name = "Glass3CardBackdropWidget";
  const Glass3CardBackdropWidget({super.key, required this.screenWidth});

  final double screenWidth;

  String getName() {
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: 40,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white.withAlpha(50),
            ),
          ),
        ),
      ),
    );
  }
}

class Glass2ClipBackdropWidget extends StatelessWidget {
  final String name = "Glass2ClipBackdropWidget";
  const Glass2ClipBackdropWidget({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: 40,
      child: Stack(
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(25),
                  // border: Border.all(color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Glass1NormalContainer extends StatelessWidget {
  final String name = "Glass1NormalContainer";
  const Glass1NormalContainer({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(25),
        // border: BoxBorder.all(width: 1),
      ),
    );
  }
}

const double kGlassBorderWidth = 200;
List<Widget> buildDemoList = [
  Glass1NormalContainer(screenWidth: kGlassBorderWidth),
  Glass2ClipBackdropWidget(screenWidth: kGlassBorderWidth),
  Glass3CardBackdropWidget(screenWidth: kGlassBorderWidth),
  Glass4ContainerShadownWidget(screenWidth: kGlassBorderWidth),
  Glass5SelfWidget(screenWidth: kGlassBorderWidth),
  Glass6BlurryContainer(screenWidth: kGlassBorderWidth),
];

final liquidglassdemo = DemoItem(
  id: "effects_liquidglass",
  title: "IOS 26 liquid class style ",
  categoryId: "effects",
  categoryTitle: "Effects",
  route: "/demo/effects_liquidglass",
  tags: ["ios", "effects", "glass"],
  difficulty: Difficulty.hard,
  description: "Try to show difference between glass and liquid",
  builder: (cxt) =>
      DemoScaffold(title: "Liquid Glass Demo", child: LiquidDemoWidget()),
);

const TextStyle kTextHighLightStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
);
