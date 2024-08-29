import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/view/screen/Home/HomeView.dart';
import 'package:todo/view/screen/Onboarding/OnboardingView.dart';
import 'package:todo/view/screen/TaskAdd/TaskAdd.dart';

abstract class AbsHomeScreenController extends GetxController {
  late AdvancedDrawerController advancedDrawerController;
  int currentindex = 0;
  List screens = [
    const Homeview(),
    const Onboardingview(),
    const TaskADDView(),
  ];

  gototaskaddpage();
  changeindex(int index);
}

class Homescreencontroller extends AbsHomeScreenController {
  @override
  void onInit() {
    advancedDrawerController = AdvancedDrawerController();
    super.onInit();
  }

  @override
  void dispose() {
    advancedDrawerController.dispose();
    super.dispose();
  }

  @override
  gototaskaddpage() {
    Get.to(
      () => const TaskADDView(),
      transition: Transition.downToUp,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  changeindex(index) {
    currentindex = index;
    update();
  }
}
