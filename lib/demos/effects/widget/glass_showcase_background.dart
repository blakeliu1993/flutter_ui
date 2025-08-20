import 'dart:math' as math;
import 'package:flutter/material.dart';

/// 一个为玻璃/液态玻璃 Demo 设计的背景：
/// - 深色渐变底色
/// - 多层 Bokeh 彩色光斑（可动画）
/// - 轻微噪声层（可开关）
///
/// 用法：
/// GlassShowcaseBackground(
///   animate: true,
///   bokehCount: 10,
///   palette: const [Color(0xFFFF6B6B), Color(0xFFFFD166), Color(0xFF4ECDC4), Color(0xFF48DBFB)],
///   child: YourGlassDemoHere(),
/// )
class GlassShowcaseBackground extends StatefulWidget {
  final Widget? child;

  /// 是否启用轻缓动画（Bokeh 漂移）
  final bool animate;

  /// 彩色光斑数量
  final int bokehCount;

  /// 光斑最大半径（像素）
  final double maxBlobRadius;

  /// 光斑整体透明度（0~1）
  final double blobOpacity;

  /// 背景深色渐变
  final Gradient? baseGradient;

  /// Bokeh 调色盘
  final List<Color> palette;

  /// 是否叠加极轻微噪声（提升材质真实感）
  final bool addGrain;

  /// 噪声强度（0~1，建议极小值）
  final double grainOpacity;

  /// 光斑模糊强度（越大越柔）
  final double blobBlurSigma;

  const GlassShowcaseBackground({
    super.key,
    this.child,
    this.animate = true,
    this.bokehCount = 12,
    this.maxBlobRadius = 160,
    this.blobOpacity = 0.18,
    this.baseGradient,
    this.palette = const [
      Color(0xFFFF6B6B), // 珊瑚红
      Color(0xFFFFD166), // 琥珀黄
      Color(0xFF4ECDC4), // 青绿
      Color(0xFF48DBFB), // 天蓝
      Color(0xFF9B5DE5), // 紫
    ],
    this.addGrain = true,
    this.grainOpacity = 0.03,
    this.blobBlurSigma = 28,
  });

  @override
  State<GlassShowcaseBackground> createState() =>
      _GlassShowcaseBackgroundState();
}

class _GlassShowcaseBackgroundState extends State<GlassShowcaseBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Blob> _blobs;
  final _rnd = math.Random(42);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    );
    if (widget.animate) _controller.repeat();

    _blobs = List.generate(widget.bokehCount, (i) {
      final color = widget.palette[i % widget.palette.length];
      final r =
          _rnd.nextDouble() * (widget.maxBlobRadius * 0.6) +
          widget.maxBlobRadius * 0.4;
      final speed = (_rnd.nextDouble() * 0.3 + 0.2) * (i.isEven ? 1 : -1);
      final phase = _rnd.nextDouble() * math.pi * 2;
      final orbit = _rnd.nextDouble() * 0.35 + 0.15; // 轨道半径（相对屏幕 min(size)）
      return _Blob(
        color: color,
        baseRadius: r,
        speed: speed,
        phase: phase,
        orbit: orbit,
      );
    });
  }

  @override
  void didUpdateWidget(covariant GlassShowcaseBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      if (widget.animate) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient =
        widget.baseGradient ??
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
        );

    final painter = _BokehPainter(
      blobs: _blobs,
      tListenable: _controller,
      opacity: widget.blobOpacity,
      blurSigma: widget.blobBlurSigma,
    );

    return RepaintBoundary(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: gradient),
        child: CustomPaint(
          painter: painter,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (widget.addGrain) _GrainOverlay(opacity: widget.grainOpacity),
              if (widget.child != null) widget.child!,
            ],
          ),
        ),
      ),
    );
  }
}

class _Blob {
  final Color color;
  final double baseRadius;
  final double speed; // 角速度方向与幅度
  final double phase;
  final double orbit; // 相对尺寸的轨道半径（0~1）

  const _Blob({
    required this.color,
    required this.baseRadius,
    required this.speed,
    required this.phase,
    required this.orbit,
  });
}

class _BokehPainter extends CustomPainter {
  final Listenable tListenable;
  final List<_Blob> blobs;
  final double opacity;
  final double blurSigma;

  _BokehPainter({
    required this.blobs,
    required this.tListenable,
    required this.opacity,
    required this.blurSigma,
  }) : super(repaint: tListenable);

  @override
  void paint(Canvas canvas, Size size) {
    final minSide = math.min(size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

    final t = (tListenable is AnimationController)
        ? (tListenable as AnimationController).value
        : 0.0;

    for (final b in blobs) {
      final angle = (t * 2 * math.pi * b.speed) + b.phase;
      final r = minSide * b.orbit;
      final pos = center + Offset(math.cos(angle) * r, math.sin(angle) * r);

      paint.shader = RadialGradient(
        colors: [b.color.withAlpha(opacity * 255.0 ~/ 1), b.color.withAlpha(0)],
      ).createShader(Rect.fromCircle(center: pos, radius: b.baseRadius));

      canvas.drawCircle(pos, b.baseRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BokehPainter oldDelegate) {
    return oldDelegate.blobs != blobs ||
        oldDelegate.opacity != opacity ||
        oldDelegate.blurSigma != blurSigma ||
        oldDelegate.tListenable != tListenable;
  }
}

class _GrainOverlay extends StatelessWidget {
  final double opacity; // 0~1
  const _GrainOverlay({required this.opacity});

  @override
  Widget build(BuildContext context) {
    // 用噪声着色器当然更优雅，这里用简单抖动网格 + 超低透明度近似，成本更低。
    return IgnorePointer(
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: CustomPaint(painter: _GrainPainter()),
      ),
    );
  }
}

class _GrainPainter extends CustomPainter {
  static const _step = 4.0; // 粒度
  final _rnd = math.Random(7);

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint();
    for (double y = 0; y < size.height; y += _step) {
      for (double x = 0; x < size.width; x += _step) {
        final v = _rnd.nextDouble() * 0.12; // 强度很低
        p.color = Colors.white.withAlpha(v * 255.0 ~/ 1);
        canvas.drawRect(Rect.fromLTWH(x, y, _step, _step), p);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; // 轻微变化即可
}
