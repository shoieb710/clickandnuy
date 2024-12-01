// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class LoginControlar extends GetxController{
  login();
  tosignup();
  toforgetpass();
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
  
}