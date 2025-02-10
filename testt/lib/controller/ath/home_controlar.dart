// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/rout.dart';

abstract class HomePageControlar extends GetxController{
  homepage();
  gotoitems(List catagoreslist,int selectedcat,List itemlist);

}

class HomePageControlarImp extends HomePageControlar {
  late TextEditingController email;

  @override
  homepage() {
  }
  @override
  gotoitems(List catagoreslist,int selectedcat,List itemlist) {
    Get.toNamed(AppRoute.items,arguments: {
        "catagoreslist": catagoreslist,
        "selectedcat" :selectedcat,
        // "itemlist" : itemlist,
        


    });
  }
  
  
}