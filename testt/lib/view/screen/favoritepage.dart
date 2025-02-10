import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/screen/ditaels.dart';
import 'package:testt/view/widget/home/customappbar.dart';
import 'package:testt/view/widget/items/stars_discription.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteControllerimp fcontrolar = Get.put(FavoriteControllerimp());
  void changsfvlist() {
    setState(() {
      
      fcontrolar.makeitemlist();
      fcontrolar.getuserdata();
      
    });
  }

    @override
  void initState() {
      setState(() {
  fcontrolar.makeitemlist();
  // fcontrolar.getuserdata();
});
      
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FavoriteControllerimp fcontrolar = Get.put(FavoriteControllerimp());
    return GetBuilder<FavoriteControllerimp>(
      builder: (fcontrolar) {
        return Scaffold(
          body: 
          fcontrolar.isloading==true? Center(child: Lottie.asset("animation/Animation.json")):
          Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomAppBar(
                    titleappbar: "52".tr,
                    onPressedNotifications: () {},
                    onPressedsearch: () {}),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: fcontrolar.favorite.isEmpty ?  Center(child: Lottie.asset("animation/Animation7.json",)):
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fcontrolar.favorite.length,
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
                                  data: fcontrolar.favorite[index],
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
                                        tag: fcontrolar.favorite[index]["tag"],
                                        child: Image.asset(
                                          fcontrolar.favorite[index]["image"],
                                          height: 140,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        fcontrolar.favorite[index]["title"],
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
                                                "${fcontrolar.favorite[index]["price"]}\$",
                                                style: TextStyle(
                                                    color: ColorApp.logo,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "sans")),
                                            GetBuilder<FavoriteControllerimp>(
                                                builder: (controller1) =>
                                                    IconButton(
                                                        onPressed: () {
                                                          // controller1.favorite
                                                          //     .remove(controller1.itemlist[
                                                          //             controller1
                                                          //                     .index1[
                                                          //                 index]]
                                                          //         ["id"]);
                                                          controller1.editfav(index);
                                                          controller1.setfavorite(controller1.favorite[
                                                                          index]
                                                                  ["id"], false);
                                                    
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
    );
  }
}
