import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/item_page_contrlollar.dart';
import 'package:testt/core/constant/color1.dart';



class CatagoresItemBuilder extends StatelessWidget {
   const CatagoresItemBuilder({super.key, required this.catagores,});
  final List catagores;



  @override
  Widget build(BuildContext context) {
    ItemsControllerimp controller = Get.put(ItemsControllerimp());
    return Container(
       padding: EdgeInsets.symmetric(vertical: 10,horizontal:10),
       height: 130,
              child: ListView.builder(
                itemCount: catagores.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      controller.changeCat(i);
                      controller.check(i);
                    },
                    child: Column(
                      children: [
                        Container( margin: const EdgeInsets.only(right: 20),
                        height: 70,
                        width: 75,
                          decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage(catagores[i]["imagepath"],),fit: BoxFit.fitWidth,
                             filterQuality: FilterQuality.high,
                             ),
                              // shape: BoxShape.circle,
                              color: ColorApp.grayshad,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                        ),
                         GetBuilder<ItemsControllerimp>(
                          builder: (controller) =>
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: controller.selectedCat== i  ? BoxDecoration(
                            border: Border(bottom: BorderSide(width: 5,color: ColorApp.logo))
                          ): null,
                          
                          child: Text(catagores[i]["title"], style: TextStyle(fontWeight: FontWeight.bold,
                                color: ColorApp.black,fontSize: 16), ),
                        ))
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            );
  }
}