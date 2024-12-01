import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Customtextfeld extends StatelessWidget {
  const Customtextfeld({super.key, required this.hinttext, required this.lebaltext,
   required this.iconData,  required this.mycontrollar,required this.validator, required this.num});
  final String hinttext;
  final String lebaltext;
  final IconData iconData;
  final String? Function(String?)? validator;
  final bool num;
  
  final TextEditingController mycontrollar;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: num? TextInputType.numberWithOptions(decimal: true): TextInputType.text,
        validator: validator,
        cursorColor: ColorApp.white,
        controller: mycontrollar,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorApp.logo,),borderRadius: BorderRadius.circular(30)),
            hintText: hinttext,
            hintStyle:const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: ColorApp.gray),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            label: Container(
              margin:const EdgeInsets.symmetric(horizontal: 20),
              child: Text(lebaltext,style:Theme.of(context).textTheme.headlineMedium,),
            ),
            suffixIcon: Icon(iconData,color: ColorApp.white,),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22))),
      ),
    );
  }
}
