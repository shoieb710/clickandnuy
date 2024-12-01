import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class VerifiycodeSignUpControlar extends GetxController{
  checkCode();
  tosuccesssignup();
}

class VerifiycodeSignUpControlarImp extends VerifiycodeSignUpControlar {
  late String code;
  @override
  checkCode() {
  }
  
  @override
  tosuccesssignup() {
    Get.offNamed(AppRoute.successinup);

  }
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }
}