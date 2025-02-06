import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';

import 'package:testt/core/constant/rout.dart';

abstract class ForgetPasswordControlar extends GetxController {
  checkEmail(email, context);
}

class ForgetPasswordControlarImp extends ForgetPasswordControlar {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  checkEmail(email, context) async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.toNamed(AppRoute.login);
      }on FirebaseAuthException catch (e) {
          AwesomeDialog(
              btnOkColor: ColorApp.logo,
              context:context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'email ont find or deleted',
                descTextStyle: TextStyle(color: ColorApp.black))
            .show();
            print(e);
      }
    } else {
      // ignore: avoid_print
      print("not vaild");
    }
  }


  @override
  void onInit() async {
    email = TextEditingController();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}

