import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';

abstract class AbsHomeController extends GetxController {
  SqlDb sqlDb = SqlDb();
  List dataTask = [];
  List numb = [1, 2, 3, 4];
  DateTime dateTime = DateTime.now();
  bool checkboxvalue = false;

  getData();

  deleteTask(id);

  changecheckbox(id);
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
    var date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    var response = await sqlDb.readData('task', "`date`='$date'");
    dataTask.addAll(response);

    update();
  }

  @override
  deleteTask(id) async {
    var response = await sqlDb.deleteData('task', "`id`='$id'");
    if (response > 0) {
      Get.snackbar("Delete", "It was completed Delete Task");
      dataTask.removeWhere((element) => element['id'] == id);
    }

    update();
  }

  @override
  changecheckbox(id) async {
    if (checkboxvalue == false) {
      checkboxvalue = true;
      await sqlDb.updateData(
          'task',
          {
            "done": '1',
          },
          "`id`==$id");
    } else {
      checkboxvalue = false;
      await sqlDb.updateData(
          'task',
          {
            "done": '0',
          },
          "`id`==$id");
    }
    update();
  }
}
