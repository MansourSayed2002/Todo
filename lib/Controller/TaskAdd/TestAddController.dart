import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';
import 'package:todo/view/screen/Home/HomeView.dart';

abstract class AbsTaskaddController extends GetxController {
  late TextEditingController autosize;
  late TextEditingController note;
  //cat=>category
  late TextEditingController cat;
  late DateTime dateTime;
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
    dateTime = DateTime.now();
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
    if (time == null) return;
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    update();
  }

  @override
  create() async {
    if (autosize.text.isNotEmpty) {
      var response = await sqlDb.insertData('task', {
        "taskt": autosize.text,
        "note": note.text,
        "date": "${dateTime.year}-${dateTime.month}-${dateTime.day}",
        "time": "${dateTime.hour}:${dateTime.minute}:00.000"
      });
      if (response > 0) {
        Get.offAll(() => const Homeview());
        Get.snackbar('Done', 'It was completed Add Task');
      }
    }
  }
}
