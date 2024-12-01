// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/view/screen/home.dart';
import 'package:testt/view/screen/favoritepage.dart';
import 'package:testt/view/screen/settings.dart';

abstract class HomeScreenControlar extends GetxController {
changrpage(int index);}



class HomeScreenControlarImp extends  HomeScreenControlar  {
  int currentpage=0;
  
  List<Widget> listpage=[
    const Home(),
    const FavoritePage(),
    const Home(),
    const Settings()
  ]
  ;
  List titel=[
    "65".tr,
    "66".tr,
    "67".tr,
    "68".tr,
  ];
  List<IconData> icons=[
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.settings,
  ];
  @override
  changrpage(int index) {
    currentpage =index;
    update();
  }
  
 }