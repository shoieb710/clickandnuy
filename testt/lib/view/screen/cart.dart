// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testt/controller/cart_controllar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/widget/cart/bottomappbarcart.dart';
import 'package:testt/view/widget/cart/cartappbar.dart';
import 'package:testt/view/widget/cart/cartcard.dart';

class Cart extends StatefulWidget{
  const Cart({super.key});
    @override
  State<Cart> createState() => _CartState();
}
  class _CartState extends State<Cart> {
     bool isloading=true;
  void time() async {
      await Future.delayed(Duration(seconds: 3));
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
    CartController controller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(size: 30),
          toolbarHeight: 80,
          backgroundColor: ColorApp.logo,
          shadowColor: ColorApp.black,
          elevation: 5,
          centerTitle: true,
          title: Cartappbar()),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) =>
           Bottomappbarcart(
            price: controller.total,
            shipping: 200,
            onPressed: () {},
            itemsnum: controller.cart.value.length, 
          )

      ),
      body:
      isloading==true? Center(child: Lottie.asset("animation/Animation.json",)) :
      Obx(() {
        return controller.cart.isEmpty ? Center(child: Lottie.asset("animation/Animation7.json",)):ListView.builder(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 15),
          itemCount: controller.cart.value.length, 
          itemBuilder: (BuildContext context, int index) {
            var item = controller.cart.value[index];
            var count = controller.itemcount[item["id"].toString()] ?? 0;

            return SizedBox(
              height: 130,
              child: CartCard(
                imagepath: item["image"],
                itemname: item["title"],
                price: item["price"],
                count: count,
                id: item["id"].toString(),
                index: index,
              ),
            );
          },
        );
      }),
    );
  }
}
