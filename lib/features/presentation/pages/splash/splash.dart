import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/graphic1-splash-page.png'),
          fit: BoxFit.none,
          alignment: Alignment(0, -1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),

              Center(
                child: SvgPicture.asset(
                  'assets/images/graphic2-splash-page.svg',
                  width: 134,
                  height: 133,
                ),
              ),

              const Spacer(flex: 2),

              RotationTransition(
                turns: Tween<double>(begin: 0, end: -1).animate(_controller),
                child: Image.asset(
                  'assets/images/graphic-loader.png',
                  width: 56,
                  height: 56,
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
