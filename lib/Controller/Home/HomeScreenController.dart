import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';
import 'package:todo/view/screen/Calender/CalenderView.dart';
import 'package:todo/view/screen/Home/HomeView.dart';
import 'package:todo/view/screen/TaskAdd/TaskAdd.dart';

abstract class AbsHomeScreenController extends GetxController {
  late AdvancedDrawerController advancedDrawerController;
  late TextEditingController cat;
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
  addDatacat();
  getDataCat();
  changeindex(int index);
  chagecheck();
  deletecat(id);
}

class Homescreencontroller extends AbsHomeScreenController {
  @override
  void onInit() {
    advancedDrawerController = AdvancedDrawerController();
    cat = TextEditingController();
    getDataCat();

    super.onInit();
  }

  @override
  void dispose() {
    advancedDrawerController.dispose();
    cat.dispose();
    super.dispose();
  }

  @override
  gototaskaddpage() {
    Get.to(() => const TaskADDView(),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 400),
        arguments: {
          "catdata": catData,
        });
  }

  @override
  changeindex(index) {
    currentindex = index;
    update();
  }

  @override
  chagecheck() {
    check == false ? check = true : check = false;
    update();
  }

  @override
  addDatacat() async {
    await sqlDb.insertData('category', {
      "categ": cat.text,
    });
    cat.clear();
    Get.back();
    getDataCat();
    update();
  }

  @override
  getDataCat() async {
    catData.clear();
    var response = await sqlDb.readData('category', null);
    catData.addAll(response);
    update();
  }

  @override
  deletecat(id) async {
    var response = await sqlDb.deleteData('category', "`id`='$id'");
    if (response > 0) {
      Get.snackbar("Delete", "It was completed Delete category");
    }
    catData.removeWhere((element) => element['id'] == id);
    update();
  }
}
