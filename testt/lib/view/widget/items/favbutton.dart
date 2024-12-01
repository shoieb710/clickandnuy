import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/core/constant/color1.dart';


class FavButton extends StatelessWidget {
  const FavButton({super.key,required this.itemlist, required this.index, required this.index1});
  final List? itemlist ;
  final int index;
  final List? index1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        builder: (controller1) => IconButton(
              onPressed: () {
                if (controller1.isfavorite[itemlist?[index]["itemid"]] =="1") {
                  controller1.setfavorite(
                      itemlist?[index]["itemid"], "0");
                  itemlist?[index]["fav"] = "0";
                  controller1.chandgeallpro("1");
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
                      itemlist?[index]["itemid"], "1");
                  itemlist?[index]["fav"] = "1";
                  controller1.chandgeallpro("0");
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
                          .isfavorite[itemlist?[index]["itemid"]] ==
                      "1"
                  ? Icons.favorite
                  : Icons.favorite_border_outlined),
              color: ColorApp.fav,
            ));
  }
}
