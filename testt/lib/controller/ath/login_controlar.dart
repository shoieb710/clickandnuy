// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/rout.dart';

abstract class LoginControlar extends GetxController {
  login(emailAddress, password, context);
  tosignup();
  toforgetpass();
  firelogin(emailAddress, password, context);
   signInWithGoogle();
}

class LoginControlarImp extends LoginControlar {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  login(emailAddress, password, context) {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      firelogin(emailAddress, password, context);
    } else {
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
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  firelogin(emailAddress, password, context) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if(credential.user!.emailVerified){
        Get.offNamed(AppRoute.home);
      }else{
            AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'your Email not verified GO To your Email and click on the verify link send to you to verify ',
                descTextStyle: TextStyle(color: ColorApp.black))
            .show();
      }
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      if (e.code == 'invalid-credential') {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'wrong in Email or password',
                descTextStyle: TextStyle(color: ColorApp.black))
            .show();
      } else if (e.code == 'channel-error') {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'Email and password can not be empty',
                descTextStyle: TextStyle(color: ColorApp.black))
            .show();
      }
    }
  }
  @override
  signInWithGoogle()async{

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null){return;}

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offNamed(AppRoute.home);
    }
  }

