// ignore: file_names
import 'package:flutter/material.dart';

class Customtextbody extends StatelessWidget {
  const Customtextbody({super.key, required this.bodytext});
  final String bodytext;

  @override
  Widget build(BuildContext context) {
    return  Text(bodytext,
            textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,);
  }
}