import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/screen/ditaels.dart';
import 'package:testt/view/widget/items/favbutton.dart';
import 'package:testt/view/widget/items/stars_discription.dart';

class Body extends StatelessWidget {
  const Body({super.key,required this.itemlist, required this.index, required this.index1});
  final List? itemlist;
  final int index;
  final List index1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Itemsdetiels(
              data: itemlist?[index],
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
                    tag: itemlist?[index]["tag"],
                    child: Image.asset(
                      itemlist?[index]["image"],
                      height: 140,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    itemlist?[index]["title"],
                    style: TextStyle(
                        color: ColorApp.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  StarsDiscription(
                    index: index,
                    itemlist: itemlist,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${itemlist?[index]["price"]}\$",
                            style: TextStyle(
                                color: ColorApp.logo,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans")),
                        FavButton(
                            itemlist: itemlist,
                            index: index,
                            index1: index1)
                      ])
                ])));
    
  }
}
