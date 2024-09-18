import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeController.dart';
import 'package:todo/Data/source/local/Sqflite.dart';
import 'package:todo/view/screen/Calender/CalenderView.dart';
import 'package:todo/view/screen/ChooseLanguage/ChooseLanguageView.dart';
import 'package:todo/view/screen/Home/HomeView.dart';
import 'package:todo/view/screen/StarTask/StarTaskView.dart';

abstract class AbsHomeScreenController extends GetxController {
  late AdvancedDrawerController advancedDrawerController;
  late TextEditingController formtast;
  late TextEditingController note;
  late TextEditingController category;

  SqlDb sqlDb = SqlDb.instance;
  DateTime dateTime = DateTime.now();
  int currentindex = 0;
  int categoryid = 0;
  bool check = false;
  List catData = [];
  List screens = [
    const Homeview(),
    const CalenderView(),
    const StartaskView(),
  ];

  // gototaskaddpage();
  gotostartaskpage();
  create();
  addDatacat();
  getDataCat();
  changeindex(int index);
  chagecheck();
  choosecat(id);
  deletecat(id);
  gotoChooselang();
}

class Homescreencontroller extends AbsHomeScreenController {
  @override
  void onInit() {
    advancedDrawerController = AdvancedDrawerController();
    category = TextEditingController();
    formtast = TextEditingController();
    note = TextEditingController();
    getDataCat();
    super.onInit();
  }

  @override
  void dispose() {
    advancedDrawerController.dispose();
    category.dispose();
    formtast.dispose();
    note.dispose();
    super.dispose();
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
      "c_categ": category.text,
    });
    Get.back();
    category.clear();
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
    var response = await sqlDb.deleteData('category', "`c_id`='$id'");
    if (response > 0) {
      Get.snackbar("Delete", "It was completed Delete category");
    }
    catData.removeWhere((element) => element['c_id'] == id);
    update();
  }

  @override
  create() async {
    if (formtast.text.isNotEmpty) {
      var response = await sqlDb.insertData('task', {
        "t_taskt": formtast.text,
        "t_note": note.text,
        "t_categ": categoryid.toString(),
        "t_date": dateTime.toString().split(' ')[0],
        "t_time": dateTime.toString().split(' ')[1],
      });
      if (response > 0) {
        Get.back();
        formtast.clear();
        Get.find<HomeController>().getData();
        Get.snackbar('Done', 'It was completed Add Task');
      }
    }
    update();
  }

  @override
  choosecat(id) {
    categoryid = id;
  }

  @override
  gotostartaskpage() {
    Get.to(() => const StartaskView(),
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300));
  }

  @override
  gotoChooselang() {
    Get.to(() => const ChooseLanguageView(),
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300));
  }
}
