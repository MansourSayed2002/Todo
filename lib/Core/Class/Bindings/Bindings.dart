import 'package:get/get.dart';
import 'package:todo/Controller/Calender/CalenderController.dart';
import 'package:todo/Controller/Home/HomeController.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Controller/Onboarding/OnboardingController.dart';
import 'package:todo/Controller/StarTask/StarTaskController.dart';
import 'package:todo/Controller/TaskAdd/TestAddController.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Taskaddcontroller(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => Homescreencontroller(), fenix: true);
    Get.lazyPut(() => Calendercontroller(), fenix: true);
    Get.lazyPut(() => Onboardingcontroller(), fenix: true);
    Get.lazyPut(() => Taskaddcontroller(), fenix: true);
    Get.lazyPut(() => Startaskcontroller(), fenix: true);
  }
}
