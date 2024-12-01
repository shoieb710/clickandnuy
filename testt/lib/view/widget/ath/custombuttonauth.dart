import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
      color: ColorApp.logo,
      textColor: ColorApp.white,child: Text(text),),
    );
  }
}