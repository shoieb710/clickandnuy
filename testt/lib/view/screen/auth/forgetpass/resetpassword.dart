import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testt/controller/ath/resetpassword_controlar.dart';

import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/core/functions/validator.dart';
import 'package:testt/view/widget/ath/customTextBody.dart';
import 'package:testt/view/widget/ath/custombuttonauth.dart';
import 'package:testt/view/widget/ath/customtextfeld.dart';
import 'package:testt/view/widget/ath/customtexttitlelog.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        ResetPasswordControlarImp controllar = Get.put(ResetPasswordControlarImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.logo,
        shadowColor: ColorApp.white,
        elevation: 5,
        centerTitle: true,
        title: Text('33'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorApp.black)),
      ),
      backgroundColor: ColorApp.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.backgroundImage),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controllar.formstate,
          child: Container(
            padding: EdgeInsets.only(top: 150),
            child: ListView(
          
              children: [
                const SizedBox(
                  height: 60,
                ),
                CustomTextTitleLog(
                  text: '34'.tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                Customtextbody(bodytext: "14".tr),
                const SizedBox(
                  height: 60,
                ),
                Customtextfeld(
                        validator: (val){return validatorT(val!, 5, 100, "email");},
                        hinttext: '14'.tr,
                        lebaltext: ' E-mail',
                        iconData: Icons.email_outlined, 
                        mycontrollar: controllar.email, num: false,
                      ),
                CustomButtonAuth(
                  text: "27".tr,
                  onPressed: () {
                  // if(controllar.password == controllar.repassword){
                    controllar.resetPassword(controllar.email.text,context);}
                  
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
