import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key, required this.image,required this.height, required this.offset, required this.spreadRadius});
  final AssetImage image;
  final double? height;
  final Offset offset;
  final double spreadRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
                  height:height,
                  decoration: BoxDecoration(
                    boxShadow:[ BoxShadow(
                      color: ColorApp.logo,
                      spreadRadius: spreadRadius,
                      blurRadius: 10,
                      offset: offset,
                    ),],
                    image:DecorationImage(image: image, ),
                    shape: BoxShape.circle
                  ))
      
  ;
  }
}