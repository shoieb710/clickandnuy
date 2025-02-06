import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testt/controller/ath/success_controlar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/widget/ath/custombuttonauth.dart';
import 'package:testt/view/widget/ath/customtexttitlelog.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessControlarImp controllar = Get.put(SuccessControlarImp());
    return Scaffold(
        appBar: AppBar(
        backgroundColor: ColorApp.logo,
        shadowColor: ColorApp.white,
        elevation: 5,
        centerTitle: true,
        title: Text('38'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorApp.black)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Icon(Icons.check_circle_outline,size: 200,color: ColorApp.logo,)),
            CustomTextTitleLog(text: '15'.tr,),
          const  SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child:
                CustomButtonAuth( text: "17".tr,onPressed: () {controllar.tologin(context);},),
              
            ),
        ],),
      ),
    );
  }
}