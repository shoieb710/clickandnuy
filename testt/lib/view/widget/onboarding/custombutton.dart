import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/onbording_controller.dart';
import 'package:testt/core/constant/color1.dart';

class CustomButton extends GetView<OnbordingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 29,
         
          child:MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            textColor: ColorApp.black,
            onPressed: () {
              controller.skip();
            },
  
            child:  Text("11".tr),
          ),

        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 35,
          child:MaterialButton(
            
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
            textColor: Colors.white,
            onPressed: () {
              controller.next();
            },
            color: ColorApp.logo,
            child:  Text("10".tr),
          ),
        ),
      ],
    );
  }
}
