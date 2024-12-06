import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

import 'package:testt/core/services/services.dart';

class Middlware extends GetMiddleware{

  @override
  int? get priority =>1;
  MyServices myServices =Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getString("onboarding")=="1"){
      return RouteSettings(name: AppRoute.splashscreen);
    }
    return null;
    
  
    

  }
}