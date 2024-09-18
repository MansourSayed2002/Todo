import 'package:get/get.dart';
import 'package:todo/Core/services/Myservices.dart';

changewidgetAcLang(widgetar, widgeten) {
  Myservices myservices = Get.find();
  var lang = myservices.sharedPreferences.getString('lang');
  if (lang == 'ar') {
    return widgetar;
  } else if (lang == "en") {
    return widgeten;
  }
}
