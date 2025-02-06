import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/rout.dart';

abstract class SignupControlar extends GetxController {
  signup(emailAddress,password,context);
  tosignin();
  createpass(emailAddress,password,context);
}

class SignupControlarImp extends SignupControlar {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController fullname;
  late TextEditingController phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  signup(emailAddress,password,context) {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      
      createpass(emailAddress,password,context);

    } else {
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
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    fullname = TextEditingController();
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

  @override
  createpass(emailAddress,password,context) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Get.offNamed(AppRoute.verifiycodesinup);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
          AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: 'The password provided is too weak',
          descTextStyle: TextStyle(color: ColorApp.black)
          ).show();
      } else if (e.code == 'email-already-in-use') {
            AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: 'The account already exists for that email',
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
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
