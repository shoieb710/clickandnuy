import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:testt/controller/ath/verifiycode_controllar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/view/widget/ath/customTextBody.dart';
import 'package:testt/view/widget/ath/customtexttitlelog.dart';


class Verifiycode extends StatelessWidget {
  const Verifiycode({super.key});
  

  @override
  Widget build(BuildContext context) {
    VerifiycodeControlarImp controllar = Get.put(VerifiycodeControlarImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.logo,
          shadowColor: ColorApp.white,
          elevation: 5,
          centerTitle: true,
          title: Text('29'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorApp.black)),
        ),
        backgroundColor: ColorApp.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageAssets.backgroundImage),fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Container(
            padding: EdgeInsets.only(top: 150),
            child: ListView(
              children: [
                    const SizedBox(
                      height: 60,
                    ),
                     CustomTextTitleLog(
                      text: '30'.tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Customtextbody(
                        bodytext:
                            "31".tr),
                    const SizedBox(
                      height: 60,
                    ),
              OtpTextField(
                enabledBorderColor: ColorApp.white,
                focusedBorderColor: ColorApp.logo,
                cursorColor: ColorApp.black,
                  numberOfFields: 5,
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  borderColor: ColorApp.logo,
                  showFieldAsBox: true, 
                  onCodeChanged: (String code) { 
                         
                       },
 
                  onSubmit: (String verificationCode){controllar.toRestpass();  },),
                  ],
                ),
              
            ),
          ),
        );
  }
}
