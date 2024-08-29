import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/Core/Class/AppRoute/AppRoute.dart';
import 'package:todo/Core/services/Myservices.dart';

class MyMiddleware extends GetMiddleware {
  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString('step') != null) {
      return const RouteSettings(
        name: AppRoute.homeScreenview,
      );
    } else {
      return const RouteSettings(
        name: AppRoute.onboarding,
      );
    }
  }
}
