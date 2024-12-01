import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Price extends StatefulWidget {
  const Price({super.key, required this.data,});
  // ignore: prefer_typing_uninitialized_variables
  final data;
    @override
  State<Price> createState() => _PriceState();
}
 class _PriceState extends State<Price> { 
  int count=0 ;
  void increment(){
    setState(() {
      count++;
    });
  
  }
    void decrement(){
    setState(() {
      count--;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Row(
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(onPressed: () {increment(); }, icon: Icon(Icons.add)),
                      Container(
                        alignment: Alignment.topCenter,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorApp.black)),
                        child: Text(
                          "$count",
                          style: TextStyle(fontSize: 20, color: ColorApp.black),
                        ),
                      ),
                      IconButton(onPressed: () {
                        if(count > 0){
                           decrement();
                        }
                      }, icon: Icon(Icons.remove))
                    ],
                  ),
                  Spacer(),
                  Text(
                    "${count ==0?widget.data["price"] : widget.data["price"] * count}\$",
                    style: TextStyle(color: ColorApp.ambr, fontSize: 25),
                  )
                ],
              );
  }
}
