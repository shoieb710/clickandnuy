import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/core/constant/color1.dart';


class FavButton extends StatefulWidget {
  const FavButton({super.key,required this.itemlist, required this.index, required this.index1, required this.catnam,});
  final List<QueryDocumentSnapshot>itemlist ;
  final int index;
  final List? index1;
  final String catnam;
  
  @override
  State<FavButton> createState() => _FavButtonState();
}
class _FavButtonState extends State<FavButton> {
    
    editfav(bool f)async {
      CollectionReference cat = FirebaseFirestore.instance.collection(widget.catnam);
      await cat.doc(widget.itemlist[widget.index].id).update(
        {"fav":f}
      );
    }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteControllerimp>(
        builder: (controller1) => IconButton(
              onPressed: () {
                
                if (controller1.isfavorite[widget.itemlist[widget.index]["id"]] ==true) {
                  controller1.setfavorite(
                      widget.itemlist[widget.index]["id"], false);
                      editfav(false);
                      
                  Get.rawSnackbar(
                    duration: const Duration(seconds: 1,microseconds: 3000),
                    titleText: Text("Notice",
                        style: TextStyle(
                            color: ColorApp.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: ColorApp.logoshadw,
                    borderColor: ColorApp.logo,
                    borderWidth: 3,
                    messageText: Text(
                        "the product has been Remove from favorite ",
                        style: TextStyle(color: ColorApp.black)),
                  );
                } else {
                  controller1.setfavorite(
                      widget.itemlist[widget.index]["id"], true);
                      editfav(true);
                      controller1.addfav(widget.itemlist[widget.index]["id"]);
                  Get.rawSnackbar(
                    duration: const Duration(seconds: 1,microseconds: 3000),
                    titleText: Text("Notice",
                        style: TextStyle(
                            color: ColorApp.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: ColorApp.logoshadw,
                    borderWidth: 3,
                    borderColor: ColorApp.logo,
                    messageText: Text(
                      "the product has been add to favorite ",
                      style: TextStyle(color: ColorApp.black),
                    ),
                  );
                }
              },
              icon: Icon(controller1
                          .isfavorite[widget.itemlist[widget.index]["id"]] ==
                      true
                  ? Icons.favorite
                  : Icons.favorite_border_outlined),
              color: ColorApp.fav,
            ));
  }
}
