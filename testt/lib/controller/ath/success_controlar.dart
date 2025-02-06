
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/rout.dart';

abstract class SuccessControlar extends GetxController{
  tologin(context);
}

class SuccessControlarImp extends SuccessControlar {

  
  @override
  tologin(context) {
    FirebaseAuth.instance.currentUser!.emailVerified
    ? Get.offAllNamed(AppRoute.login)   
    : AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: 'email is no verified ',
          descTextStyle: TextStyle(color: ColorApp.black)
          ).show();
    

  }

  
}