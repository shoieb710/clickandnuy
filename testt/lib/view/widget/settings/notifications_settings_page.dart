import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testt/core/constant/color1.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool myOrders = true;
  bool reminders = true;
  bool newOffers = true;
  bool feedbackReviews = true;
  bool updates = true;

  Widget platformSwitch(bool val) {
    if (Platform.isIOS) {
      return CupertinoSwitch(
        onChanged: (value) {
          setState(() {
            val = value;
          });
        },
        value: true,
        activeColor: ColorApp.logo,
      );
    } else {
      return Switch(
        onChanged: (value) {
          setState(() {
            val = value;
          });
        },
        value: val,
        activeColor: ColorApp.logo,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Padding(
          padding: const EdgeInsets.only(top:24.0,left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('My orders'),
                      trailing: platformSwitch(myOrders),
                    ),
                    ListTile(
                      title: Text('Reminders'),
                      trailing: platformSwitch(reminders),
                    ),
                    ListTile(
                      title: Text('New Offers'),
                      trailing: platformSwitch(newOffers),
                    ),
                    ListTile(
                      title: Text('Feedbacks and Reviews'),
                      trailing: platformSwitch(feedbackReviews,)
                    ),
                    ListTile(
                      title: Text('Updates'),
                      trailing: platformSwitch(updates),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
