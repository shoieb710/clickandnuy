import 'package:get/get.dart';
import 'package:testt/controller/ath/signup_controller.dart';

class Mybinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> SignupControlarImp(),fenix: true);
  }
  
}