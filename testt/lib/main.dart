import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testt/core/constant/api.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/localization/changelocal.dart';
import 'package:testt/core/localization/translation.dart';
import 'package:testt/core/services/services.dart';
import 'package:testt/routes.dart';


Future<void> main() async {
  Gemini.init(apiKey: OPENAI_API_KETG);
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    LocalControllar controllar = Get.put(LocalControllar());
    return GetMaterialApp(
      // initialBinding: Mybinding(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controllar.language,
      theme: ThemeData(
        // ignore: unrelated_type_equality_checks
        fontFamily: controllar.language == "en" ? "PlayfairDisplay" :"Cairo",
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headlineLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorApp.logo,
              fontSize: 28,
            ),
            headlineMedium:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: ColorApp.logo,
            ),
           headlineSmall:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: ColorApp.black,
            ),
            bodyLarge:const TextStyle(
                height: 1.5,
                color: ColorApp.gray,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            bodyMedium: const TextStyle(
                height: 1.5,
                color: ColorApp.white,
                fontSize: 14),
           bodySmall: TextStyle(
                height: 1.5,
                color: ColorApp.gray800,
                fontSize: 14),
          )),
      // routes: routes,
      getPages: getPages,
      
    );
  }
}

