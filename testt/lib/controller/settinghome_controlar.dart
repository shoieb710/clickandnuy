import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';
import 'package:testt/core/services/services.dart';

class SettingsHomeController extends GetxController{
    MyServices myServices = Get.find();

    logout(){
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoute.login);
    }
    changepassword(){
        Get.toNamed(AppRoute.resetpassword);
    }
    tochangelang(){
      Get.toNamed(AppRoute.changelang);
    }
        tochangecountry(){
      Get.toNamed(AppRoute.changecountry);
    }
        tolegal(){
      Get.toNamed(AppRoute.legalabout);
    }
        tonotificationsettings(){
      Get.toNamed(AppRoute.notificationsettings);
    }
}