import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';

abstract class AbsHomeController extends GetxController {
  DateTime dateTime = DateTime.now();
  SqlDb sqlDb = SqlDb.instance;
  List dataTask = [];
  late int cat = 0;

  getData();

  deleteTask(id);

  showdate(context);

  changecheckbox(id, index);

  addtasktostartask(idtask);
}

class HomeController extends AbsHomeController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    dataTask.clear();
    var date = dateTime.toString().split(' ')[0];
    var response = await sqlDb.readData("task", "`t_date`='$date'");
    dataTask.addAll(response);
    update();
  }

  @override
  deleteTask(id) async {
    var response = await sqlDb.deleteData('task', "`t_id`='$id'");
    if (response > 0) {
      Get.snackbar("Delete", "It was completed Delete Task");
      dataTask.removeWhere((element) => element['t_id'] == id);
    }
    update();
  }

  @override
  changecheckbox(id, index) async {
    if (dataTask[index]['t_done'] == 0) {
      await sqlDb.updateData(
          'task',
          {
            "t_done": 1,
          },
          "`t_id`==$id");
      getData();
    } else if (dataTask[index]['t_done'] == 1) {
      await sqlDb.updateData(
          'task',
          {
            "t_done": 0,
          },
          "`t_id`==$id");
      getData();
    }
    update();
  }

  @override
  addtasktostartask(idtask) async {
    await sqlDb.insertData('startask', {
      "s_idtask": idtask,
    });
    update();
  }

  // @override
  // create() async {
  //   if (formtast.text.isNotEmpty) {
  //     var response = await sqlDb.insertData('task', {
  //       "t_taskt": formtast.text,
  //       "t_note": note.text,
  //       "t_categ": cat.toString(),
  //       "t_date": dateTime.toString().split(' ')[0],
  //       "t_time": dateTime.toString().split(' ')[1],
  //     });
  //     if (response > 0) {
  //       Get.back();
  //       formtast.clear();
  //       Get.snackbar('Done', 'It was completed Add Task');
  //       getData();
  //     }
  //   }
  //   update();
  // }

  // @override
  // choosecat(id) {
  //   cat = id;
  // }

  @override
  showdate(context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(4000),
    );
    if (date == null) return;
    TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute,
        ));
    if (time == null) {
      dateTime = date;
    } else {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    }
    update();
  }
}
