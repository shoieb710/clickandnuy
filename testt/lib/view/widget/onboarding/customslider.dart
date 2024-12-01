import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/onbording_controller.dart';
import 'package:testt/data/datasource/static/static.dart';

class CustomSliderOnboarding extends GetView<OnbordingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged:(value) {
        controller.onpageChanged(value);
      } ,
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(children: [                
              Image.asset(
                  onBoardingList[i].image!,
                  width: double.infinity,
                  height: 290,
                  fit: BoxFit.fill,
                  filterQuality:FilterQuality.high,
                ),
              Container(
                height: 150,
                padding:const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: 
                    Text(
                      onBoardingList[i].title!,
                      style:Theme.of(context).textTheme.headlineLarge,
                    ),
                  
                ),
              const  SizedBox(height: 4,),
                Container(
                  padding:const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
            ]));
  }
}
