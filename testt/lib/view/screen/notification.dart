import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:testt/controller/notificationcontrolar.dart';
import 'package:testt/core/constant/color1.dart';


class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    // NotificationControllerImp controller = Get.put(NotificationControllerImp());
        return Container(
            padding:EdgeInsets.all(10),
            child: ListView(children:[
                const Center(
                    child:Text(
                        "Notification",
                        style:TextStyle(
                            fontSize:24,
                            color: ColorApp.logo,
                            fontWeight:FontWeight.bold,
                        )
                    )),
                    // ...List.generate(
                    //     controller.data.length,
                    //     (index)=> ListTile(
                    //         title: Text(controller.data[index]['notification_title']),
                    //         subtitle:
                    //             Text(controller.data[index]['notification_body'])
                    //     )
                    // )
                
            ])
        );
        }
    }