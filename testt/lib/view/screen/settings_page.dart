import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testt/controller/settinghome_controlar.dart';
import 'package:testt/core/constant/color1.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsHomeController controller= Get.put(SettingsHomeController());
    return CustomPaint(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: TextStyle(color: ColorApp.gray800),
          ),
          elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
                      builder:(builder,constraints)=> SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Language A / का'),
                    leading: Image.asset('images/icons/language.png'),
                    onTap: () {controller.tochangelang();}
                            ),
                   ListTile(
                    title: Text('Change Country'),
                     leading: Image.asset('images/icons/country.png'),
                    onTap: () {controller.tochangecountry();}
                           ),
                   ListTile(
                    title: Text('Notifications'),
                     leading: Image.asset('images/icons/notifications.png'),
                    onTap: () {controller.tonotificationsettings();}
                  ,
                  ),
                   ListTile(
                    title: Text('Legal & About'),
                     leading: Image.asset('images/icons/legal.png'),
                    onTap: () {controller.tolegal();}
                    ),
                   ListTile(
                    title: Text('About Us'),
                     leading: Image.asset('images/icons/about_us.png'),
                    onTap: (){},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Change Password'),
                    leading: Image.asset('images/icons/change_pass.png'),
                    onTap: () {controller.changepassword();}
                  ),
                  ListTile(
                    title: Text('Sign out'),
                      leading: Image.asset('images/icons/sign_out.png'),
                    onTap: (){controller.logout();}
                  ),
                  
                ],
              ),
            ),
                        ),
                      )
          ),
        ),
      ),
    );
  }
}


