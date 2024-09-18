import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Core/services/Myservices.dart';

class Mylocalization extends GetxController {
  Locale? language;

  Myservices myservices = Get.find();

  changelang(languageCode) {
    Locale loc = Locale(languageCode);
    myservices.sharedPreferences.setString('lang', languageCode);
    Get.updateLocale(loc);
  }

  @override
  void onInit() {
    var lang = myservices.sharedPreferences.getString('lang');
    if (lang == "ar") {
      language = const Locale('ar');
    } else if (lang == "en") {
      language = const Locale("en");
    } else {
      language = Get.deviceLocale;
    }
    super.onInit();
  }
}
