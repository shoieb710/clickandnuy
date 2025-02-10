import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/controller/item_page_contrlollar.dart';
// import 'package:testt/core/constant/catagorylist.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/core/constant/itemslist.dart';
import 'package:testt/core/constant/rout.dart';

import 'package:testt/view/widget/home/catagores.dart';
import 'package:testt/view/widget/home/customappbar.dart';
import 'package:testt/view/widget/home/imageslider.dart';
import 'package:testt/view/widget/items/itembuilder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<QueryDocumentSnapshot> catagorylist=[];
  // FavoriteControllerimp cont=Get.put(FavoriteControllerimp());
  bool isloading=true;
  getdata()async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('categories').get();
    catagorylist.addAll(querySnapshot.docs);
    isloading =false;
    setState(() {
    });
  }
  @override
  void initState() {
    // cont.makeitemlist();
    // cont.getuserdata();
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isloading==true? Center(child: Lottie.asset("animation/Animation.json")) : Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          CustomAppBar(titleappbar: '52'.tr, onPressedNotifications: () { Get.toNamed(AppRoute.chat); }, onPressedsearch: () {  },),
          Text(
            "54".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          CatagoresBuilder(catagores: catagorylist,),
          Text(
            "53".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ImageSlider(
            imagePaths: [
              ImageAssets.onbordingImageFour,
              ImageAssets.onbordingImageOne,
              ImageAssets.onbordingImageThree,
              ImageAssets.onbordingImageTwo
            ],
          ),
          Text(
            "63".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
           SizedBox(height: 20,),
          Builditems(items: bestitems),
           SizedBox(height: 20,),
         Text(
            "64".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
           SizedBox(height: 20,),
          Builditems(items: itemsoffers),
        ],
      ),
    );
  }
}
