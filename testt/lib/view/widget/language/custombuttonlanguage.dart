import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Custombuttonlanguage extends StatelessWidget {
  const Custombuttonlanguage({super.key, required this.textbutton, this.onPressed});
  final String textbutton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: MaterialButton(
                textColor:ColorApp.white,
                color: ColorApp.logo,
                onPressed: onPressed,
              child:  Text(textbutton,style:Theme.of(context).textTheme.bodyMedium,),),
            );
  }
}