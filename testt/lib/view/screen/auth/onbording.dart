
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/onbording_controller.dart';
import 'package:testt/view/widget/onboarding/custombutton.dart';


import 'package:testt/view/widget/onboarding/customslider.dart';
import 'package:testt/view/widget/onboarding/dotcontellor.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnbordingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: 

      Column(
        children: [
        Expanded(
          flex: 5,
          child:
          CustomSliderOnboarding(),
        ),

      Expanded(
        flex: 1,
        child: 
      Column(
        children:const[
          CustomDotControllerOnBoarding(),
        SizedBox( height: 35, ),
       CustomButton(), ],
      ),)
        ],
      ),
         ));
          
        }
  }
