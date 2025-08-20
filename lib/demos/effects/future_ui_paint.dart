import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_models.dart';
import 'package:flutter_ui/core/widgets/demo_scaffold.dart';

const String _sourceCode = '''''';

class FutureUiPaintWidget extends StatelessWidget {
  const FutureUiPaintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Z4-Background-Blur.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/z4-background-bar.png"),
                fit: BoxFit.contain,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.lock_outline, color: Colors.white),
                RoundCircleWidget(
                  child: Icon(Icons.lock_outline, color: Colors.white),
                ),
                RoundCircleWidget(child: Text('   ')),
                BorderShadowWrapper(
                  borderRadius: 50,
                  isCircular: true,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  // SizedBox(
                  //   height: 35,
                  //   width: 35,
                  //   child: Icon(
                  //     Icons.lock_outline,
                  //     color: Colors.white,
                  //     size: 30,
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final futureUiPaintDemo = DemoItem(
  id: 'future_ui_paint',
  title: "Paint to Figma",
  categoryId: "effects",
  categoryTitle: "Effects",
  route: "/demo/future_ui_paint",
  tags: ["Future", "Paint"],
  difficulty: Difficulty.medium,
  builder: (context) => const DemoScaffold(
    sourceCode: _sourceCode,
    title: "Paint like Figma",
    child: FutureUiPaintWidget(),
  ),
);

/// 对于UI稿的理解；
/// 首先是有一个白色80%的2范围的阴影
/// 然后是黑色20%的4范围的阴影
/// 最后是一圈白色渐变的边界，
class RoundCircleWidget extends StatelessWidget {
  final Widget child;
  const RoundCircleWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // painter: _InnerShadownCircle(),
      child: Container(
        // decoration: BoxDecoration(
        //   shape: BoxShape.circle,
        //   border: Border.all(color: Colors.white, width: 1),
        //   boxShadow: [

        //   ]
        // ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

/// 新的自定义边框和阴影效果Widget
class BorderShadowWrapper extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final bool isCircular;

  const BorderShadowWrapper({
    super.key,
    required this.child,
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isCircular) {
      // 圆形版本：使用 circle shape 的阴影并用圆形渐变描边
      return Stack(
        alignment: Alignment.center,
        children: [
          // 第一层阴影：白色80%，dy=2，spread=4
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // 第二层阴影：黑色20%，dy=4，spread=4
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          // 渐变圆形边框和内容
          CustomPaint(
            painter: GradientBorderPainterCircle(
              borderWidth: borderWidth,
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: EdgeInsets.all(borderWidth),
              child: ClipOval(child: child),
            ),
          ),
        ],
      );
    }

    // 原矩形/圆角矩形实现
    return Stack(
      children: [
        // 第一层阴影：白色80%，dy=2，spread=4
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius + 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha((0.8 * 255).round()),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
        ),
        // 第二层阴影：黑色20%，dy=4，spread=4
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius + 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.2 * 255).round()),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
        ),
        // 渐变边框和内容
        CustomPaint(
          painter: GradientBorderPainter2(
            borderWidth: borderWidth,
            borderRadius: borderRadius,
          ),
          child: Padding(padding: EdgeInsets.all(borderWidth), child: child),
        ),
      ],
    );
  }
}

/// 新的渐变边框绘制器
class GradientBorderPainter2 extends CustomPainter {
  final double borderWidth;
  final double borderRadius;

  GradientBorderPainter2({
    required this.borderWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // 创建渐变：透明 -> 白色 -> 透明
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.transparent,
        Colors.white.withAlpha((0.8 * 255).round()),
        Colors.white,
        Colors.white.withAlpha((0.8 * 255).round()),
        Colors.transparent,
      ],
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = gradient.createShader(rect);

    // 绘制圆角矩形边框
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 圆形渐变边框绘制器，使用 SweepGradient 绕圆心环绕绘制
class GradientBorderPainterCircle extends CustomPainter {
  final double borderWidth;
  final double borderRadius;

  GradientBorderPainterCircle({
    required this.borderWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    // 半径按最短边计算，并把描边宽度的一半留在内侧，避免超出 Canvas
    final double radius = min(size.width, size.height) / 2 - borderWidth / 2;
    if (radius <= 0) return;

    final rect = Rect.fromCircle(
      center: center,
      // radius: radius + borderWidth / 2,
      radius: borderRadius + borderWidth / 2,
    );

    // 环绕渐变：透明 -> 半透明白 -> 白 -> 半透明白 -> 透明
    final gradient = SweepGradient(
      startAngle: 0.0, //0 —— 3 点钟（右） 顺时针
      endAngle: pi * 2,
      // colors: [
      //   Colors.transparent,
      //   Colors.white.withAlpha((0.8 * 255).round()),
      //   Colors.white,
      //   Colors.white.withAlpha((0.8 * 255).round()),
      //   Colors.transparent,
      // ],
      // stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
      colors: [
        Colors.white.withAlpha((0.2 * 255).round()),
        Colors.white,
        Colors.white,
        Colors.white.withAlpha((0.2 * 255).round()),
        Colors.transparent,
        Colors.white.withAlpha((0.2 * 255).round()),
        Colors.white,
        Colors.white,
        Colors.white.withAlpha((0.2 * 255).round()),
        Colors.transparent,
      ],
      stops: const [
        0,
        1 / 16,
        3 / 16,
        4 / 16,
        6 / 16,
        8 / 16,
        9 / 16,
        11 / 16,
        12 / 16,
        14 / 16,
      ],
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = gradient.createShader(rect);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
