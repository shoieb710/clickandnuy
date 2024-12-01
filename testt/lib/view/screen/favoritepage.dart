import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/itemslist.dart';
import 'package:testt/view/screen/ditaels.dart';
import 'package:testt/view/widget/home/customappbar.dart';
import 'package:testt/view/widget/items/stars_discription.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteController fcontrolar = Get.put(FavoriteController());
  void changsfvlist() {
    setState(() {
      fcontrolar.makefavlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteController fcontrolar = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
                titleappbar: "52".tr,
                onPressedNotifications: () {},
                onPressedsearch: () {}),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: fcontrolar.favorite?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 280,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Itemsdetiels(
                              data: fcontrolar.favorite?[index],
                            ),
                          ));
                        },
                        child: Card(
                            shadowColor: ColorApp.logoshadw,
                            elevation: 20,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: fcontrolar.favorite?[index]["tag"],
                                    child: Image.asset(
                                      fcontrolar.favorite?[index]["image"],
                                      height: 140,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    fcontrolar.favorite?[index]["title"],
                                    style: TextStyle(
                                        color: ColorApp.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  StarsDiscription(
                                      index: index,
                                      itemlist: fcontrolar.favorite),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${fcontrolar.favorite?[index]["price"]}\$",
                                            style: TextStyle(
                                                color: ColorApp.logo,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "sans")),
                                        GetBuilder<FavoriteController>(
                                            builder: (controller1) =>
                                                IconButton(
                                                    onPressed: () {
                                                      controller1.favorite
                                                          ?.remove(allproducts[
                                                                  controller1
                                                                          .index1[
                                                                      index]]
                                                              ["itemid"]);
                                                      allproducts[controller1
                                                              .index1[index]]
                                                          ["fav"] = "0";
                                                      changsfvlist();
                                                    },
                                                    icon: Icon(Icons
                                                        .delete_outline_outlined)))
                                      ])
                                ])));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
