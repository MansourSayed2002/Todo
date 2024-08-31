import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';
import 'package:todo/view/screen/Calender/CalenderView.dart';
import 'package:todo/view/screen/Home/HomeView.dart';
import 'package:todo/view/screen/TaskAdd/TaskAdd.dart';

abstract class AbsHomeScreenController extends GetxController {
  late AdvancedDrawerController advancedDrawerController;
  int currentindex = 0;
  SqlDb sqlDb = SqlDb();
  bool check = false;
  List catData = [];
  List screens = [
    const Homeview(),
    const CalenderView(),
    const TaskADDView(),
  ];

  gototaskaddpage();
  getDataCat();
  changeindex(int index);
  chagecheck();
}

class Homescreencontroller extends AbsHomeScreenController {
  @override
  void onInit() {
    advancedDrawerController = AdvancedDrawerController();
    getDataCat();
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

  @override
  chagecheck() {
    check == false ? true : false;
    update();
  }

  @override
  getDataCat() async {
    var response = await sqlDb.readData('category', null);
    catData.addAll(response);

    update();
  }
}
