import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:testt/core/constant/rout.dart';
import 'package:testt/core/localization/changelocal.dart';
import 'package:testt/view/widget/language/custombuttonlanguage.dart';

class Language extends GetView<LocalControllar> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Custombuttonlanguage(
                textbutton: 'AR',
                onPressed: () {
                  controller.changeLang("AR");
                  Get.offNamed(AppRoute.onBoarding);
                }),
            Custombuttonlanguage(
                textbutton: 'EN',
                onPressed: () {
                  controller.changeLang("EN");
                  Get.offNamed(AppRoute.onBoarding);
                })
          ],
        ),
      ),
    );
  }
}
