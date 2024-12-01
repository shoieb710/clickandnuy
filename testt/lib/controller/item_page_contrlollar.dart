import'package:get/get.dart';
import 'package:testt/core/constant/itemslist.dart';
abstract class ItemsController extends GetxController{
    intialData();
    changeCat(int val);
    check(int cat);
    gotoproduct(itemsModel);

}
class ItemsControllerimp extends ItemsController{
    List categories =[];
    int? selectedCat ;
    List<Map>? itemlist=[];
    List index=[];


     @override
    void onInit(){
        intialData();
        super.onInit();
    }

    @override
    intialData(){
        categories = Get.arguments['catagoreslist'];
        selectedCat = Get.arguments['selectedcat'];
        itemlist = Get.arguments['itemlist'];
      

        

    }
    @override
    check(int cat){
      itemlist=[];
      index=[];
      for(int i=0; i < allproducts.length;i++){
        if(cat == allproducts[i]["id"]){
          itemlist?.add(allproducts[i]);
          index.add(i);
        }
      }update();  
    }
   

    @override
    changeCat(val){
        selectedCat=val;
    
        update();
        
    }
    
      @override
      gotoproduct(itemsModel) {
        Get.toNamed("itemdetales",arguments: {
          "itemsModel":itemsModel
        });
      }


}