import 'package:get/get.dart';
import 'package:todo/Core/services/Myservices.dart';

Myservices myservices = Get.find();
langaugeWidgetApp(widget1, widget2) {
  var lang = myservices.sharedPreferences.getString('lang');
  if (lang == 'ar') {
    return widget1;
  } else {
    return widget2;
  }
}
