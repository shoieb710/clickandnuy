import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/catagorylist.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/core/constant/itemslist.dart';

import 'package:testt/view/widget/home/catagores.dart';
import 'package:testt/view/widget/home/customappbar.dart';
import 'package:testt/view/widget/home/imageslider.dart';
import 'package:testt/view/widget/items/itembuilder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          CustomAppBar(titleappbar: '52'.tr, onPressedNotifications: () {  }, onPressedsearch: () {  },),
          Text(
            "54".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          CatagoresBuilder(catagores: catagoreslist,),
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
