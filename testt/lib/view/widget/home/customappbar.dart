import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar ({super.key, required this.titleappbar,required this.onPressedNotifications, required this.onPressedsearch});
  final String titleappbar;
  final void Function() onPressedNotifications;
  final void Function() onPressedsearch;

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only(top: 5,bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          prefixIcon: IconButton(onPressed: onPressedsearch, icon: const Icon(Icons.search, size: 40)),
                          hintStyle: TextStyle(fontSize: 20),
                          hintText: titleappbar,
                          fillColor: Colors.grey[200],
                          filled: true)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorApp.logo),
                  width: 60,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: MaterialButton(
                      onPressed: onPressedNotifications,
                      textColor: ColorApp.white,
                      child: Text("AI",style: TextStyle(fontSize: 25),),
                  ),
                )
              ],
            ),
          );
  }
}