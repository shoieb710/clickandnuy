import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/localization/changelocal.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangeCountryPageState createState() => _ChangeCountryPageState();
}

class _ChangeCountryPageState extends State<ChangeLanguagePage> {
  List<String> languages = [
    "العربيه",
    'English',
    'Chinesse',
    'Spanish',
    'Romanian',
    'German',
    'Portuguese',
    'Bengali',
    'Russian',
    'Japanese',
    'French',
  ];

  String currentLanguage = '';

  @override
  Widget build(BuildContext context) {
    LocalControllar controllar =Get.put(LocalControllar());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
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
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Language A / का',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: languages
                      .map((l) => ListTile(
                            onTap: () {
                              setState(() {
                                if(l=="العربيه"){
                                  controllar.changeLang("ar");
                                }
                                else if(l == "English"){controllar.changeLang("en");}
                                currentLanguage = l;
                              });
                            },
                            title: Text(
                              l,
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: l == currentLanguage
                                ? Icon(
                                    Icons.check_circle,
                                    color: ColorApp.logo,
                                    size: 16,
                                  )
                                : SizedBox(),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
