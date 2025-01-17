import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Myservices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await ScreenUtil.ensureScreenSize();
    return this;
  }
}

Future initservices() async {
  await Get.putAsync(() => Myservices().init());
}
