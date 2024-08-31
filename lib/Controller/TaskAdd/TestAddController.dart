import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';
import 'package:todo/view/screen/Home/HomescreenView.dart';

abstract class AbsTaskaddController extends GetxController {
  late TextEditingController autosize;
  late TextEditingController note;
  //cat=>category
  late TextEditingController cat;
  late DateTime dateTime = DateTime.now();
  SqlDb sqlDb = SqlDb();

  showdate(context);
  create();
}

class Taskaddcontroller extends AbsTaskaddController {
  @override
  void onInit() {
    autosize = TextEditingController();
    note = TextEditingController();
    cat = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    autosize.dispose();
    note.dispose();
    cat.dispose();
    super.dispose();
  }

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

  @override
  create() async {
    if (autosize.text.isNotEmpty) {
      var response = await sqlDb.insertData('task', {
        "taskt": autosize.text,
        "note": note.text,
        "date": dateTime.toString().split(' ')[0],
        "time": dateTime.toString().split(' ')[1],
      });
      if (response > 0) {
        Get.offAll(const Homescreenview());
        Get.snackbar('Done', 'It was completed Add Task');
      }
    }
  }
}
