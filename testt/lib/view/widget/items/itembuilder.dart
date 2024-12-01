import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/view/screen/ditaels.dart';

class Builditems extends StatelessWidget {
  const Builditems({super.key, required this.items,});
  final List items;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Itemsdetiels(
                          data: items[i],
                        ),
                      ));
                    },
                    child: Card(
                      elevation: 10,
                      shadowColor: ColorApp.logo,
                      surfaceTintColor: ColorApp.logoshadw,
                      margin: EdgeInsets.only(left: 20),
                      child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                              // margin: const  EdgeInsets.symmetric(horizontal: 10) ,
                              child: Hero(tag: items[i]["tag"], child: Image.asset(
                                items[i]["image"],
                                fit: BoxFit.fill,
                                height: 136,
                                width: 200,
                              ),)
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  items[i]["title"],
                                  style:   Theme.of(context).textTheme.headlineSmall
                                ),
                                // Text("tht",
                                //   // items[i]["dis"],
                                //   style: Theme.of(context).textTheme.bodySmall
                                // ),
                                // Text(
                                //   "${items[i]["price"]}\$",
                                //   style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorApp.ambr),textAlign: TextAlign.start,
                                // ),
                              ],
                            )
                          ]),
                    ),
                  );
                }),
    );
  }
}