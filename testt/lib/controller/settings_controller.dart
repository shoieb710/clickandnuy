import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';
import 'package:testt/core/services/services.dart';

class SettingsController extends GetxController{
    MyServices myServices = Get.find();

    logout(){
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoute.login);
    }
    changepassword(){
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoute.resetpassword);
    }
}
