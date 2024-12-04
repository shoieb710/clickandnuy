import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Bottomappbarcart extends StatelessWidget {
  const Bottomappbarcart({super.key, required this.price, required this.shipping,required this.onPressed, required this.itemsnum});
  final num price;
  final int shipping;
  final int itemsnum;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar( 
        shadowColor: ColorApp.logo,
        elevation:8,
        height: 166,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Price",style:TextStyle(color: ColorApp.gray, fontSize: 17))),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("$price\$",style:TextStyle(color: ColorApp.gray, fontSize: 17)))
                ],),
                              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text("Shipping",style:TextStyle(color: ColorApp.gray, fontSize: 17))),
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text("${shipping*itemsnum}\$",style:TextStyle(color: ColorApp.gray, fontSize: 17)))
                ],),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(),
                ),
                              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                                   Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text("Total Price",style:TextStyle(color: ColorApp.ambr, fontSize: 17))),
                                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child:Text("${price + shipping*itemsnum}\$",style:TextStyle(color: ColorApp.ambr, fontSize: 17)))
                ],),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  width: double.infinity,
                  child: MaterialButton(
                    shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                    textColor:ColorApp.white,
                    color: ColorApp.logo,
                    onPressed: onPressed,
                  child:  Text("Place Order",style:Theme.of(context).textTheme.bodyMedium,),),
                ),
            ],
          ),);
  }
}