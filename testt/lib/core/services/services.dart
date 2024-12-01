import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async{
    sharedPreferences= await SharedPreferences.getInstance();
    return this;
  }
}
initialServices() async{
  await Get.putAsync(()=>MyServices().init());
}