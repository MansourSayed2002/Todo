import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Core/services/Myservices.dart';
import 'package:todo/view/screen/Home/HomescreenView.dart';

abstract class AbsOnboardingcontroller extends GetxController {
  int currentindex = 0;

  late PageController pageController;
  Myservices myservices = Get.find();

  chageindex(index);
  gotoHomeScreenPage();
}

class Onboardingcontroller extends AbsOnboardingcontroller {
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  chageindex(index) {
    currentindex = index;
    update();
  }

  @override
  gotoHomeScreenPage() {
    myservices.sharedPreferences.setString('step', '1');
    Get.offAll(
      () => const Homescreenview(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),
    );
  }
}
