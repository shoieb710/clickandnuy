import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';
import 'package:testt/core/services/services.dart';

class SettingsController extends GetxController{
    MyServices myServices = Get.find();

    logout() async {
        myServices.sharedPreferences.clear();
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed(AppRoute.login);
    }
    changepassword(){
        Get.toNamed(AppRoute.resetpassword);
    }
     topayment(){
        Get.toNamed(AppRoute.payment);
    }
         topaymenthestory(){
        Get.toNamed(AppRoute.paymenthistory);
    }
             toaddress(){
        Get.toNamed(AppRoute.addaddresspage);
    }
}
