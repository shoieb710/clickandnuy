import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:testt/core/constant/itemslist.dart';

class FavoriteController extends GetxController{
  Map isfavorite ={};
  List? favorite=[];
  List index1=[];
  setfavorite(id,val){
    isfavorite[id]=val;
    update();
  }
  makefavlist(){
    favorite=[];
    index1=[];
    for(int i=0; i < allproducts.length;i++){
        if(allproducts[i]["fav"] == "1"){
          favorite?.add(allproducts[i]);
          index1.add(i);
        }
        }update();
        }
    chandgeallpro(String i,){
    for(int i=0; i < allproducts.length;i++){
      for(int j=0; j < favorite!.length;j++){
        if(allproducts[i]["itemid"] == favorite![i]["itemid"]){
          allproducts[i]["fav"]== i;
        }}
        }update();
        }
}