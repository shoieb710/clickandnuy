import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/view/screen/auth/login.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.logoImage),
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorApp.logoshadw,
                    spreadRadius: 8,
                    blurRadius: 10,
                    offset: Offset(5, 7),
                  ),
                ],
              ))
        ],
      ),
      backgroundColor: ColorApp.logo,
      nextScreen: const Login(),
      splashIconSize: 200,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(seconds: 1),
    );
  }
}
