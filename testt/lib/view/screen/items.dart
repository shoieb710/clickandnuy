import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/controller/item_page_contrlollar.dart';
import 'package:testt/core/constant/catagorylist.dart';
import 'package:testt/core/functions/loading.dart';
import 'package:testt/view/widget/home/categoresitems.dart';
import 'package:testt/view/widget/home/customappbar.dart';
import 'package:testt/view/widget/items/body.dart';

class Items extends StatefulWidget {
  const Items({Key? Key}) : super(key: Key);
  @override
  State<Items> createState() => _ItemsState();
}
class _ItemsState extends State<Items> {
       bool isloading=true;
  void time() async {
      await Future.delayed(Duration(seconds: 1,milliseconds: 200));
      isloading =false;
      setState(() {
        
      });
  }
    @override
  void initState() {
    time();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    FavoriteController fcontrolar =Get.put(FavoriteController());
    return Scaffold(
      body: 
      isloading==true? Loading() :
      ListView(
        children: [
          CustomAppBar(
              titleappbar: "52".tr,
              onPressedNotifications: () {},
              onPressedsearch: () {}),
          SizedBox(height: 20),
          CatagoresItemBuilder(catagores: catagoreslist),
          GetBuilder<ItemsControllerimp>(
              builder: (controller) => Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.itemlist!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 280,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          fcontrolar.isfavorite[controller.itemlist?[index]["itemid"]] = controller.itemlist?[index]["fav"];
                          return 
                           Body(itemlist: controller.itemlist, index: index, index1: fcontrolar.index1);
                        }),
                  ))
        ],
      ),
    );
  }
}
