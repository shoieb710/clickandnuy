import 'package:flutter/material.dart';

class CustomTextTitleLog extends StatelessWidget {
  const CustomTextTitleLog( {super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return   Text(text,textAlign: TextAlign.center,style: Theme.of(context)
                .textTheme
                .headlineMedium);

  }
}