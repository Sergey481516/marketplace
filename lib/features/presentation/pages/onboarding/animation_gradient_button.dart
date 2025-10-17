import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedGradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const AnimatedGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<AnimatedGradientButton> createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(); // бесконечная анимация
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final double shift = _controller.value * 2 - 1;

        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
              stops: [0.1, 0.3, 0.4],
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
              tileMode: TileMode.clamp,
            ).createShader(bounds);
          },
          child: FilledButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Get Started'),
                SizedBox(width: 10),
                Transform.rotate(
                  angle: 180 * pi / 180,
                  child: SvgPicture.asset(
                    'assets/icons/Arrow.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Color(0xFF101010), // глубокий черный (фон)
                Color(0xFFAAAAAA), // светло-серебристый блик
                Color(0xFFFFFFFF), // яркий отражённый свет
              ],
              stops: const [-1, 0.5, 1.0],
              begin: Alignment(-1.0 + shift, 0),
              end: Alignment(1.0 + shift, 0),
            ).createShader(bounds);
          },
          child: FilledButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Get Started'),
                SizedBox(width: 10),
                Transform.rotate(
                  angle: 180 * pi / 180,
                  child: SvgPicture.asset(
                    'assets/icons/Arrow.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
