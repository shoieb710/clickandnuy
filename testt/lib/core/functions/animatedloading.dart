import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testt/core/constant/color1.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplashScreenLoading extends StatelessWidget {
  const SplashScreenLoading({super.key, required this.nextScreen, required this.path});
  final Widget nextScreen;
  final String path;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Lottie.asset(path),
        ],
      ),
      backgroundColor: ColorApp.logo,
      nextScreen: nextScreen,
      splashIconSize: 200,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(seconds: 1),
    );
  }
}
