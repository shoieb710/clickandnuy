// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/rout.dart';

abstract class LoginControlar extends GetxController{
  login();
  tosignup();
  toforgetpass();
  firelogin(emailAddress,password,context);
}

class LoginControlarImp extends LoginControlar {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();

  @override
  login() {
    var formdata= formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.home);
    }else{
      print("not vaild");
    }
  }
  
  @override
  tosignup() {
    Get.offNamed(AppRoute.signup);
  }
    @override
  toforgetpass() {
    Get.toNamed(AppRoute.forgetpassword);
  }
  @override
  void onInit() {
    email =TextEditingController();
    password =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    
    super.dispose();
  }
  
  @override
  firelogin(emailAddress,password,context) async {
    
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
  login();
} on FirebaseAuthException catch (e) {
  // print(e.code);
  if (e.code == 'invalid-credential') {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'wrong in Email or password',
            descTextStyle: TextStyle(color: ColorApp.black)
            ).show();
  } 
   else if (e.code == 'channel-error') {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'Email and password can not be empty',
            descTextStyle: TextStyle(color: ColorApp.black)
            ).show();
  } 
}

  }
  
}