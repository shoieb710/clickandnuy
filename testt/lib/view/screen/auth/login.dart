import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/ath/login_controlar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/core/functions/alertexitapp.dart';
import 'package:testt/core/functions/validator.dart';
import 'package:testt/view/widget/ath/customTextBody.dart';
import 'package:testt/view/widget/ath/custombuttonauth.dart';
import 'package:testt/view/widget/ath/customtextfeld.dart';
import 'package:testt/view/widget/ath/customtexttitlelog.dart';
import 'package:testt/view/widget/ath/logoauth.dart';
import 'package:testt/view/widget/ath/secretpass.dart';
import 'package:testt/view/widget/ath/textsignup.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginControlarImp controllar= Get.put(LoginControlarImp());
    return Scaffold(
        appBar: AppBar(
          leading: Container(width: 10,),
          backgroundColor: ColorApp.logo,
          shadowColor: ColorApp.white,
          elevation: 5,
          centerTitle: true,
          title: Text('17'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorApp.black)),
        ),
        backgroundColor: ColorApp.white,
        body:
        // ignore: deprecated_member_use
        WillPopScope(onWillPop: alertExitApp,
        child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageAssets.backgroundImage),fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child:Form(
            
             key: controllar.formstate ,
            child:
          
          ListView(
            children: [
              const SizedBox(height: 8,),
              Logoauth(image: AssetImage(ImageAssets.logoImage), height: 150, offset: Offset(5, 7), spreadRadius: 8,),
              const SizedBox( height: 15, ),
               CustomTextTitleLog(
                text: '12'.tr,
              ),
              const SizedBox(height: 10,),
               Customtextbody(
                  bodytext:
                      "13".tr),
              const SizedBox( height: 45, ),
               Customtextfeld(
                validator: (val){return validatorT(val, 5, 100, "email");},
                hinttext: '14'.tr,
                lebaltext: ' E-mail',
                iconData: Icons.email_outlined,
                 mycontrollar: controllar.email, num: false,
              ),
              Secretpass(controllar: controllar.password,validator: (val){return validatorT(val, 8, 16, "password");},),
              Textsignup(text1: "16".tr, text2: "", 
              onTap: (){controllar.toforgetpass();},mainAxisAlignment: MainAxisAlignment.end,),
              CustomButtonAuth(
                text: "17".tr,
                onPressed: () {controllar.login(controllar.email.text, controllar.password.text,context);
            },
              ),
              const SizedBox( height: 20, ),
              InkWell(
                onTap: () {controllar.signInWithGoogle();},
                child: Logoauth(image: AssetImage(ImageAssets.google), height: 50, offset: Offset(1, 2), spreadRadius: 5,),
              ),
              const SizedBox( height: 10, ),
              Textsignup(text1: "18".tr, text2: "19".tr, 
              onTap: (){controllar.tosignup();},mainAxisAlignment: MainAxisAlignment.center,)

            ],
          ),
        ))));
  }
}