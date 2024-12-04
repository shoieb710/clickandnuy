import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/cart_controllar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/widget/cart/bottomappbarcart.dart';
import 'package:testt/view/widget/cart/cartappbar.dart';
import 'package:testt/view/widget/cart/cartcard.dart';

class Cart extends GetView<CartController> {
  const Cart({super.key});

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
      bottomNavigationBar: Bottomappbarcart(
        price: controller.total,
        shipping: 200,
        onPressed: () {},
        itemsnum: controller.cart.value.length, // استخدام .value للوصول للقائمة
      ),
      body: Obx(() {
        // استخدام Obx لتحديث الواجهة تلقائيًا عندما يتغير cart أو itemcount
        return ListView.builder(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 15),
          itemCount: controller.cart.value.length, // استخدام .value
          itemBuilder: (BuildContext context, int index) {
            // الحصول على البيانات من cart باستخدام .value
            var item = controller.cart.value[index];
            var count = controller.itemcount[item["itemid"].toString()] ?? 0;

            return SizedBox(
              height: 130,
              child: CartCard(
                imagepath: item["image"],
                itemname: item["title"],
                price: item["price"],
                count: count,
                id: item["itemid"].toString(),
                index: index,
              ),
            );
          },
        );
      }),
    );
  }
}
