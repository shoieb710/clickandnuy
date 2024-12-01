import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class ForgetPasswordControlar extends GetxController{
  checkEmail();
  toVerfiyCode();
}

class ForgetPasswordControlarImp extends ForgetPasswordControlar {
  late TextEditingController email;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  @override
  checkEmail() {
        var formdata= formstate.currentState;
    if(formdata!.validate()){
      toVerfiyCode();
    }else{
      // ignore: avoid_print
      print("not vaild");
    }
  }
  
  @override
  toVerfiyCode() {
    Get.offNamed(AppRoute.verifiycode);

  }
  @override
  void onInit() {
    email =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
}