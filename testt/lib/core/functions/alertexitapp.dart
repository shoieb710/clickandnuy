import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';



Future<bool> alertExitApp(){
   Get.defaultDialog(title: "42".tr,
   backgroundColor: ColorApp.gray,
  middleText: "43".tr,
  actions: [ElevatedButton(onPressed:() {exit(0);} , 
  
    child: Text("44".tr),),
  ElevatedButton(onPressed:() {Get.back();} ,
  style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(ColorApp.logo),
  textStyle:WidgetStatePropertyAll(TextStyle(color: ColorApp.white)),), child: Text("45".tr))]);
  return Future.value(true);
}