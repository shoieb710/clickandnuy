import 'package:get/get.dart';

abstract class DitealsControllar extends GetxController{



}
class DitealsControllarImp extends DitealsControllar{
  // ignore: prefer_typing_uninitialized_variables
  late final  itemsModel;
  intialData(){
    itemsModel =Get.arguments["itemsModel"];
  }

  
  
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

}