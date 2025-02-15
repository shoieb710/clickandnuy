import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/home_controlar.dart';
import 'package:testt/core/constant/color1.dart';




class CatagoresBuilder extends StatelessWidget {
  const CatagoresBuilder({super.key, required this.catagores,});
  final List<QueryDocumentSnapshot> catagores;
  
 

  @override
  Widget build(BuildContext context) {

    HomePageControlarImp controller = Get.put(HomePageControlarImp());
    return Container(
       padding: EdgeInsets.symmetric(vertical: 10),
       height: 130,
              child: ListView.builder(
                itemCount: catagores.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                       controller.gotoitems(catagores, i);
                      //  icontroller.getdata();
                    },
                    child: Column(
                      children: [
                        Container( margin: const EdgeInsets.only(right: 20),
                        height: 70,
                        width: 75,
                          decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage(catagores[i]["image"],),fit: BoxFit.fitWidth,
                             filterQuality: FilterQuality.high,
                             ),
                              // shape: BoxShape.circle,
                              color: ColorApp.grayshad,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                        ),
                        Text(catagores[i]["name"], style: TextStyle(fontWeight: FontWeight.bold,
                              color: ColorApp.black,fontSize: 16), )
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            );
  }
}