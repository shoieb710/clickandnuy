import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class VerifiycodeControlar extends GetxController{
  checkCode();
  toRestpass();
}

class VerifiycodeControlarImp extends VerifiycodeControlar {
  late String code;
  @override
  checkCode() {
  }
  
  @override
  toRestpass() {
    Get.offNamed(AppRoute.resetpassword);

  }
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }
}