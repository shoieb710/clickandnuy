import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/ath/home_controlar.dart';
import 'package:testt/core/constant/catagorylist.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/itemslist.dart';




class CatagoresBuilder extends StatelessWidget {
  const CatagoresBuilder({super.key, required this.catagores,});
  final List catagores;
  
 

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic,dynamic>> itemlist=[];
     List index=[];
  List check(int cat){
      itemlist=[];
      index=[];
      for(int i=0; i < allproducts.length;i++){
        if(cat == allproducts[i]["id"]){
          itemlist.add(allproducts[i]);
          index.add(i);
        }
      } 
      return itemlist;
    }
    HomePageControlarImp controller = Get.put(HomePageControlarImp());
    return Container(
       padding: EdgeInsets.symmetric(vertical: 10),
       height: 130,
              child: ListView.builder(
                itemCount: catagores.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                       controller.gotoitems(catagoreslist, i, check(i));
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
                        Text(catagores[i]["title"], style: TextStyle(fontWeight: FontWeight.bold,
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