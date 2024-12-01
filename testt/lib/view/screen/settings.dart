
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/settings_controller.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';

class Settings extends StatefulWidget {
  const Settings ({super.key});
    @override
  State<Settings> createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {
  bool isswitched = false;
changecase(bool value){
  setState(() {
    isswitched=value;
  });
}
  @override
  Widget build(BuildContext context) {
    SettingsController controller=Get.put(SettingsController());
    return ListView(  
      children:[ Stack(
          clipBehavior:Clip.none,
          alignment:Alignment.center,
      children:[
      Container(height: Get.width / 3,color: ColorApp.logo),
      Positioned(top: Get.width / 3.9, child: Container(
          padding:EdgeInsets.all(15),
          decoration: BoxDecoration(  color: Colors.white,borderRadius:BorderRadius.circular(100)),
          child:CircleAvatar(
              radius:40 ,
              backgroundColor:Colors.grey[100],
              backgroundImage: AssetImage(ImageAssets.avatar),
          ),
      )),
      ]),
      SizedBox(height:70),
      Container(
          padding:EdgeInsets.symmetric(horizontal:10),
              child:Column(
                children: [
    
                   Container(
                    padding: EdgeInsets.all(15),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text("Settings",style:TextStyle(color: ColorApp.black,fontWeight: FontWeight.bold,fontSize: 26),textAlign: TextAlign.start,),
                       ],
                     ),
                   ),
                  Card(
                      child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children:[
     
                   ListTile(
                      onTap:() {},
                      title:Text("Disable notifications"),
                      trailing: Switch(onChanged:(val){changecase(val);},value:isswitched),
                  ),
                   Divider(), 
                  ListTile(
                      onTap:() {},
                      title:Text("about us"),
                      trailing: Icon(Icons.help_outline_rounded),
                  ),
                   Divider(),
                  ListTile(
                      onTap:() {},
                      title:Text("contact us"),
                      trailing: Icon(Icons.phone_callback_outlined),
                  ),
                                       Divider(), 
                  ListTile(
                      onTap:() {controller.changepassword();},
                      title:Text("Change Password"),
                      trailing: Icon(Icons.password_outlined),
                  ),
                   Divider(),
                  ListTile(
                      onTap:() {
                          controller.logout();
                      },
                      title:Text("logout"),
                      trailing: Icon(Icons.exit_to_app),
                  ),
                              ]
                          ),
                          ),
                          SizedBox(height: 15,),
                    Container(height: 5,width: double.infinity,color: ColorApp.logoshadw,),
                   Container(
                    padding: EdgeInsets.all(15),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text("Payment",style:TextStyle(color: ColorApp.black,fontWeight: FontWeight.bold,fontSize: 26),textAlign: TextAlign.start,),
                       ],
                     ),
                   ),
                  Card(
                      child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children:[
     
                   ListTile(
                      onTap:() {},
                      title:Text("Payment method"),
                      trailing: Icon(Icons.payment_outlined)),
    
                   Divider(), 
                  ListTile(
                      onTap:() {},
                      title:Text("Previous payments"),
                      trailing: Icon(Icons.payments_outlined),
                  ),
                                      
                   Divider(),
                   ListTile(
                      onTap:() {},
                      title:Text("Address"),
                      trailing: Icon(Icons.my_location_outlined),
                  ),
                              ]
                          ),
                          ),
                ],
              ),)
        ],);
  }
}
