import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/onbording_controller.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnbordingControllerImp>(builder:(controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  margin: const EdgeInsets.only(right: 5),
                  width: controller.currentPage == index ? 35 : 5,
                  height: 6,
                  decoration: BoxDecoration(
                      color: ColorApp.logo,
                      borderRadius: BorderRadius.circular(10)),
                ))
      ],
    ));
  }
}
