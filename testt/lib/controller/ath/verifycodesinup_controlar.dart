
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class VerifiycodeSignUpControlar extends GetxController{
  checkCode(context);
  tosuccesssignup();
}

class VerifiycodeSignUpControlarImp extends VerifiycodeSignUpControlar {
  late String code;
  @override
  checkCode(context) {
    // FirebaseAuth.instance.currentUser!.emailVerified
    // ? tosuccesssignup()    
    // : AwesomeDialog(
    //       context: context,
    //       dialogType: DialogType.error,
    //       animType: AnimType.rightSlide,
    //       title: 'Error',
    //       desc: 'email is no verified ',
    //       descTextStyle: TextStyle(color: ColorApp.black)
    //       ).show();
    tosuccesssignup();
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