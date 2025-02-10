import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController{
  RxList<QueryDocumentSnapshot> cart = RxList<QueryDocumentSnapshot>(); // قائمة المنتجات
  RxMap<String, int> itemcount = RxMap<String, int>();
  num total=0;
  addtocartlist(product){
    cart.add(product);
    update();
        }
  totalprice(){
    total=0;
    for(var item in cart){
      total += (item["price"] ?? 0) * (itemcount[item["id"].toString()] ?? 0);
    }update();
  }
  additemcount(id,count1){
    itemcount[id]=count1;
    
    update();
  }
    removat(index){
      cart.removeAt(index);
    update();
  }
}