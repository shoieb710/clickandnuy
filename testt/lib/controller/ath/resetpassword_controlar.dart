import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class ResetPasswordControlar extends GetxController{
  resetPassword();
  toSuccess();
}

class ResetPasswordControlarImp extends ResetPasswordControlar {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();

  @override
  resetPassword() {
    var formdata= formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.success);
    }else{
      // ignore: avoid_print
      print("not vaild");
    }
  }
  
  @override
  toSuccess() {
    Get.offNamed(AppRoute.success);

  }
  @override
  void onInit() {
    password =TextEditingController();
    repassword =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
  
}