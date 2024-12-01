import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class SignupControlar extends GetxController{
  signup();
  tosignin();
}

class SignupControlarImp extends SignupControlar {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController fullname;
  late TextEditingController phone;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();

  @override
  signup() {
    var formdata= formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.verifiycodesinup);
    }else{
      // ignore: avoid_print
      print("not vaild");
    }
  }
  
  @override
  tosignin() {
    Get.offNamed(AppRoute.login);

  }
  @override
  void onInit() {
    email =TextEditingController();
    password =TextEditingController();
    phone =TextEditingController();
    fullname =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    fullname.dispose();
    
    super.dispose();
  }
  
}