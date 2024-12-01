import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height:200,
                  decoration: BoxDecoration(
                    boxShadow:[ BoxShadow(
                      color: ColorApp.logo,
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(5, 7 ),
                    ),],
                    image:DecorationImage(image: AssetImage(ImageAssets.logoImage), ),
                    shape: BoxShape.circle
                  ))
      
  ;
  }
}