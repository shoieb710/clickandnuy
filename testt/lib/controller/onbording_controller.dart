import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';
import 'package:testt/core/services/services.dart';
import 'package:testt/data/datasource/static/static.dart';

abstract class OnbordingController extends GetxController{
  next();
  onpageChanged(int index);

}
class OnbordingControllerImp extends OnbordingController{
  late PageController pageController;
  MyServices myServices =Get.find();
  int currentPage=0;
  @override
  next() {
    currentPage ++;
    if (currentPage > onBoardingList.length-1){
      myServices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoute.login);

    }else{
    pageController.animateToPage(currentPage, duration: Duration(microseconds: 900), curve: Curves.easeInOut);}

  }
  skip() {
    Get.offAllNamed(AppRoute.login);

  }

  @override
  onpageChanged(int index) {
    currentPage= index;
    update();

  }
  @override
  void onInit() {
    pageController=PageController();
  
    super.onInit();
  }

  
}