import 'dart:ui';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testt/core/services/services.dart';

class LocalControllar extends GetxController{
  Locale? language ; 
  MyServices myServices=Get.find();
  changeLang(String lang){
    Locale locale= Locale(lang);
    myServices.sharedPreferences.setString("lang", lang);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? langshared =myServices.sharedPreferences.getString("lang");
    if(langshared == "ar"){
      language = const Locale("ar");
    }else if (langshared == "en"){
      language= const Locale("en");
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}