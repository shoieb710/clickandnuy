import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testt/core/constant/color1.dart';

class ImageOfProduct extends StatelessWidget {
  const ImageOfProduct({super.key,required this.data});
  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  Widget build(BuildContext context) {
    return         Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: ColorApp.logoshadw,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
            ),
            Positioned(
              top: 45.0,
              right: Get.width / 8,
              left: Get.width / 8,
              child: Hero(
                  tag: data["tag"],
                  child: Image.asset(
                    data["image"],
                    height: 250,
                  )),
            )
          ],
        );
  }
}