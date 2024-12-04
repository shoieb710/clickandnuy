import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Custombuttonappbar extends StatelessWidget {
  const Custombuttonappbar(
      {super.key,
      // required this.text,
      required this.icon,
      required this.onPressed,
      required this.activr});
  // final String text;
  final IconData? icon;
  final bool? activr;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icon,
          color: activr == true ? ColorApp.gray800 : ColorApp.white,
          size: 22,
        ),
        // Text(
        //   text,
        //   style: TextStyle(
        //       color: activr == true ? ColorApp.gray800 : ColorApp.white,
        //       fontSize: 10),
        // )
      ]),
    );
  }
}
