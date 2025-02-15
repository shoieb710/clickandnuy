import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/controller/item_page_contrlollar.dart';
import 'package:testt/view/widget/home/categoresitems.dart';
import 'package:testt/view/widget/home/customappbar.dart';
import 'package:testt/view/widget/items/body.dart';

class Items extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const Items({Key? Key}) : super(key: Key);
  @override
  State<Items> createState() => _ItemsState();
}
class _ItemsState extends State<Items> {
    List<QueryDocumentSnapshot> catagorylist=[];
    ItemsControllerimp controller = Get.put(ItemsControllerimp());
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
    controller.getdata();
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    FavoriteControllerimp fcontrolar =Get.put(FavoriteControllerimp());
    return Scaffold(
      body: 
      isloading==true? Center(child: Lottie.asset("animation/Animation.json")) :
      ListView(
        children: [
          CustomAppBar(
              titleappbar: "52".tr,
              onPressedNotifications: () {},
              onPressedsearch: () {}),
          SizedBox(height: 20),
          CatagoresItemBuilder(catagores: catagorylist),
          GetBuilder<ItemsControllerimp>(
              builder: (controller) => Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.itemlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 280,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          // fcontrolar.isfavorite[controller.itemlist[index]["id"]] = controller.itemlist[index]["fav"];
                          // fcontrolar.itemlist=controller.itemlist;
                          // fcontrolar.index=index;
                          fcontrolar.selectedcat=controller.selectedCat;
                          return 
                           Body(itemlist: controller.itemlist, index: index, index1: fcontrolar.index1, catnam: controller.catname[controller.selectedCat],);
                        }),
                  ))
        ],
      ),
    );
  }
}
