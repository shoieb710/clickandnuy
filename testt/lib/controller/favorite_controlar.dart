

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class FavoriteController extends GetxController{
    setfavorite(id,val);
     getdata(name,id);
     makeitemlist();
     editfav(int index);
     addfav(id); 
     getuserdata();

}
  class FavoriteControllerimp extends FavoriteController{
  Map isfavorite ={};
  List<QueryDocumentSnapshot> favorite=[];
  int? selectedcat;
  List<QueryDocumentSnapshot> idlist=[];
  List index1=[];
  List<QueryDocumentSnapshot> fivid=[];
  bool isloading=true;
  // int? index;
  List<String> catname=["stationery","Beauty","Furniture","Health","Accessories","Electronics","Food & Drink","Fashion"];


  @override
  setfavorite(id,val){
    isfavorite[id]=val;
    update();
  }
  // @override
  // makeitemlist(){
  //   //  itemlist=[];
  //   favorite=[];
  //   for(int i=0; i < catname.length;i++){
  //     getdata(catname[i]);
  //     for(int j=0; j < itemlist.length;j++){
  //       if(itemlist[j]["fav"]== true){
  //       favorite.add(itemlist[j]);
  //       setfavorite(itemlist[j]["id"],true);
  //       index1.add(j);
  //   itemlist=[];
      
  //     }}}
    
  //   print("$itemlist  itm");
  //   print(favorite);
  //   update();
  //   }
    @override
   Future<void> getdata(name,id)async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection(name)
    .where("id",isEqualTo:id ).get();
    favorite.addAll(querySnapshot.docs);
    update();
  }
  
  // @override
  // makefavlist() {
  //   favorite=[];
  //   for(int i=0; i < itemlist.length;i++){
  //     if(itemlist[i]["fav"]== true){
  //       favorite?.add(itemlist[i]);
  //       setfavorite(itemlist[i]["id"],true);
  //       index1.add(i);
  //     }}
  //     print(favorite);
  //     update();}
  
  @override
  editfav(int index) async{
    isloading =true;
    await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email!).doc(idlist[index].id).delete();
       isloading =false;
    update();

  }
  
  @override
  makeitemlist() async{
    favorite=[];
    await getuserdata();
    for(int i=0; i < catname.length;i++){
      
      for(int j=0; j < idlist.length;j++){
      getdata(catname[i],idlist[j]["favitemid"]);
    
  }
  }
  print("f$favorite");
   isloading=false;
   update();
  }
       @override
      Future<void> addfav(id) async{
      CollectionReference users = FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email!);
      return users
          .add({
            "id":  FirebaseAuth.instance.currentUser?.uid,
            "favitemid": id,
            "cartitemid": ""
          })
          // ignore: avoid_print
          .then((value) => print("User Added"))
          // ignore: avoid_print
          .catchError((error) => print("Failed to add user: $error"));
    }
    
    @override
    Future<void>getuserdata() async{
      idlist=[];
      QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email!).get();
      idlist.addAll(querySnapshot.docs);
      print("l$idlist");
      update();
      }

  }
  

  