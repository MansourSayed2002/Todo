import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';
import 'package:todo/view/screen/TaskAdd/TaskAdd.dart';

abstract class AbsHomeController extends GetxController {
  SqlDb sqlDb = SqlDb();
  List dataTask = [];
  List numb = [1, 2, 3, 4];
  DateTime dateTime = DateTime.now();
  bool checkboxvalue = false;
  gototaskaddpage();
  getData();
  deleteTask(id, index);
  changecheckbox(id);
}

class HomeController extends AbsHomeController {
  @override
  void onInit() {
    getData();

    super.onInit();
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
  getData() async {
    dataTask.clear();
    var date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    var response = await sqlDb.readData('task', "`date`='$date'");
    dataTask.addAll(response);

    update();
  }

  @override
  deleteTask(id, index) async {
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