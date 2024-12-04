import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Cartappbar extends StatelessWidget {
  const Cartappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cart",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.white),
              ),
              SizedBox(
                width: 10,
              ),
              Text('My',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold)),
            ],
          );
  }
}