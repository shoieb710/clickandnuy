import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/ath/signup_controller.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/core/functions/alertexitapp.dart';
import 'package:testt/core/functions/validator.dart';
import 'package:testt/view/widget/ath/customTextBody.dart';
import 'package:testt/view/widget/ath/custombuttonauth.dart';
import 'package:testt/view/widget/ath/customtextfeld.dart';
import 'package:testt/view/widget/ath/customtexttitlelog.dart';
import 'package:testt/view/widget/ath/secretpass.dart';
import 'package:testt/view/widget/ath/textsignup.dart';


class Signup extends StatelessWidget {
  const Signup({super.key});
  

  @override
  Widget build(BuildContext context) {
    SignupControlarImp controllar =Get.put(SignupControlarImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.logo,
          shadowColor: ColorApp.white,
          elevation: 5,
          centerTitle: true,
          title: Text('18'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorApp.black)),
        ),
        backgroundColor: ColorApp.white,
        // ignore: deprecated_member_use
        body:WillPopScope(onWillPop: alertExitApp,
        child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageAssets.backgroundImage),fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controllar.formstate ,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                 CustomTextTitleLog(
                  text: '15'.tr,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Customtextbody(
                    bodytext:
                        "20".tr),
                const SizedBox(
                  height: 40,
                ),
                Customtextfeld(
                  validator: (val){return validatorT(val!, 5, 100, "username");},
                  hinttext: '21'.tr,
                  lebaltext: 'full Name',
                  iconData: Icons.person_2_outlined, 
                  mycontrollar: controllar.fullname, num: false,
                ),
                 Customtextfeld(
                  validator: (val){return validatorT(val!, 5, 11, "phone");},
                  hinttext: '22'.tr,
                  lebaltext: ' Phone',
                  iconData: Icons.phone_android_outlined, 
                  mycontrollar: controllar.phone,num: true
                ),
                 Customtextfeld(
                  validator: (val){return validatorT(val!, 5, 100, "email");},
                  hinttext: '14'.tr,
                  lebaltext: ' E-mail',
                  iconData: Icons.email_outlined, 
                  mycontrollar: controllar.email,num: false
                ),
                Secretpass(controllar: controllar.password,validator: (val){return validatorT(val!, 8, 16, "password");},),
            
                CustomButtonAuth(
                  text: "18".tr,
                  onPressed: () {
                    // controllar.signup();
                  controllar.signup(controllar.email.text, controllar.password.text,context);},
                ),
                const SizedBox(
                  height: 20,
                ),
                Textsignup(text1: "17".tr, text2: "25".tr, 
                onTap: (){controllar.tosignin();},mainAxisAlignment: MainAxisAlignment.center,)
              ],
            ),
          ),
        )));
  }
}
