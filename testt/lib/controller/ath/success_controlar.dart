
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class SuccessControlar extends GetxController{
  tologin();
}

class SuccessControlarImp extends SuccessControlar {

  
  @override
  tologin() {
    Get.offAllNamed(AppRoute.login);

  }

  
}