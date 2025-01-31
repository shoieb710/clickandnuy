import 'package:firebase_auth/firebase_auth.dart';
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
    if(FirebaseAuth.instance.currentUser != null){
      return RouteSettings(name: AppRoute.home);
    }
    return null;
    
  
    

  }
}