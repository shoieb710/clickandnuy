import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/cart_controllar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/view/widget/ath/custombuttonauth.dart';
import 'package:testt/view/widget/product/colorbutton.dart';
import 'package:testt/view/widget/product/img_product.dart';
import 'package:testt/view/widget/product/price.dart';

class Itemsdetiels extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const Itemsdetiels({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: CustomButtonAuth(
            text: 'Add To Cart',
            onPressed: () {
              controller.addtocartlist(data);
              controller.totalprice();
              Get.rawSnackbar(
                duration: const Duration(seconds: 1, microseconds: 3000),
                titleText: Text("Notice",
                    style: TextStyle(
                        color: ColorApp.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                backgroundColor: ColorApp.logoshadw,
                borderColor: ColorApp.logo,
                borderWidth: 3,
                messageText: Text("the product has been added to Cart ",
                    style: TextStyle(color: ColorApp.black)),
              );
            }),
      ),
      endDrawer: const Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30),
        toolbarHeight: 80,
        backgroundColor: ColorApp.logo,
        shadowColor: ColorApp.white,
        elevation: 5,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    ImageAssets.logoImagewithoutname,
                  )),
                  shape: BoxShape.circle),
            ),
            Text(
              "Shop",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "PlayfairDisplay",
                  fontWeight: FontWeight.bold,
                  color: ColorApp.white),
            ),
            SizedBox(
              width: 10,
            ),
            Text('Click & Buy',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "PlayfairDisplay",
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(children: [
        ImageOfProduct(
          data: data,
        ),
        SizedBox(
          height: 70,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["title"],
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: ColorApp.black),
              ),
              SizedBox(
                height: 5,
              ),
              Price(
                data: data,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${data["subtitle"]}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ColorApp.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Aveilable Colors",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: ColorApp.black),
              ),
              SizedBox(
                height: 10,
              ),
              Colorbutton(
                avelablecolors: data["avelablecolor"],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
