import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Textsignup extends StatelessWidget {
  const Textsignup({super.key, required this.text1, required this.text2, required this.onTap, required this.mainAxisAlignment,});
  final String text1;
  final String text2;
  final MainAxisAlignment mainAxisAlignment;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(text2),
        InkWell(
          onTap: onTap,
          child: Text(
            text1,
            style:TextStyle(color: ColorApp.logo, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
