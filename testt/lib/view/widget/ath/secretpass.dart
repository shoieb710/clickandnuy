import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';

class Secretpass extends StatefulWidget {
  const Secretpass({super.key, required this.controllar,required this.validator});
  final TextEditingController controllar;
  final String? Function(String?)? validator;

  @override
  State<Secretpass> createState() => _SecretpassState();
}

class _SecretpassState extends State<Secretpass> {
  bool obscurText=true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: TextFormField(
            validator: widget.validator,
            obscureText: obscurText,
            cursorColor: ColorApp.white,
            controller: widget.controllar,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorApp.logo,),borderRadius: BorderRadius.circular(30)),
                hintText: "23".tr,
                hintStyle:const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: ColorApp.gray),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                label: Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Password",style:Theme.of(context).textTheme.headlineMedium,),
                ),
                suffixIcon: IconButton(icon:Icon( obscurText? Icons.visibility_off : Icons.visibility),
                color: ColorApp.white, onPressed: () { setState(() {
                  obscurText =! obscurText;
                }); },),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(22))),
          ),
        ),
      ],
    );
  }
}