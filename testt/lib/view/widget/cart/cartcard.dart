import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/cart_controllar.dart';
import 'package:testt/core/constant/color1.dart';

// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  CartCard(
      {super.key,
      required this.imagepath,
      required this.itemname,
      required this.price,
      required this.count,
      required this.id, required this.index});
  final String imagepath;
  final String itemname;
  final int price;
  late int count;
   final int index;
  final String id;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  CartController controlar = Get.put(CartController());
  void increment() {
    setState(() {
      widget.count++;
    });
  }

  void decrement() {
    setState(() {
      widget.count--;
    });
  }



  @override
  Widget build(BuildContext context) {
    CartController controlar = Get.put(CartController());
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(
              widget.imagepath,
              height: 130,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      widget.itemname,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      " ${widget.count == 0 ? widget.price : widget.price * widget.count}\$",
                      style: TextStyle(color: ColorApp.ambr, fontSize: 17),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GetBuilder<CartController>(
                          builder: (controllar) =>
                             IconButton(
                                onPressed: () {
                                  controllar.cart.removeAt(widget.index);
                                  controllar.totalprice();
                                  controllar.update();
                                  print(controllar.cart.length);
                               

                                },
                                icon: Icon(Icons.delete_outline_outlined))
                          
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorApp.black, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {
                              
                             
                              controlar.additemcount(widget.id, widget.count);
                              controlar.totalprice();
                               increment();
                            },
                            iconSize: 15,
                            alignment: Alignment.center,
                            icon: Icon(Icons.add),
                            color: ColorApp.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${widget.count}",
                          style: TextStyle(
                            fontFamily: "sans",
                            color: ColorApp.black,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorApp.black, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (widget.count > 0) {
                                
                                controlar.additemcount(widget.id, widget.count);
                                controlar.totalprice();
                            
                                decrement();
                              }
                            },
                            icon: Icon(Icons.remove),
                            iconSize: 15,
                            alignment: Alignment.center,
                            color: ColorApp.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
