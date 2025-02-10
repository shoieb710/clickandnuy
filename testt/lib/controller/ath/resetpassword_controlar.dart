import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/rout.dart';

abstract class ResetPasswordControlar extends GetxController{
  resetPassword(email,context);
}

class ResetPasswordControlarImp extends ResetPasswordControlar {
  late TextEditingController email;

  @override
  resetPassword(email,context)async {
      try {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    AwesomeDialog(
          btnOk: SizedBox(
            width: 50,
            child: MaterialButton(onPressed:(){Get.offNamed(AppRoute.home);} ,
            
            color: ColorApp.logo,child: Text("ok"),),
          ),
          btnOkColor: ColorApp.logo,
          context:context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'success',
            desc: 'go to your email to reset your password',
            descTextStyle: TextStyle(color: ColorApp.black))
        .show();
} on FirebaseAuthException catch (e) {
      AwesomeDialog(
          btnOkColor: ColorApp.logo,
          context:context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: '$e',
            descTextStyle: TextStyle(color: ColorApp.black))
        .show();
      
  }
  }
  @override
  void onInit() {
   email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
}