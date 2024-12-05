import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      
      CircularProgressIndicator(
         color: ColorApp.logo,
         strokeCap: StrokeCap.butt,
      ),
    );
  }
}