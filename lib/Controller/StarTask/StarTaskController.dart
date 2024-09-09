import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';

abstract class AbsStarTaskController extends GetxController {
  SqlDb sqlDb = SqlDb.instance;
  List dataStarTask = [];
  bool checkboxvalue = false;

  getData();

  removeTaskFromStarTAsk(id);

  changecheckbox(id);
}

class Startaskcontroller extends AbsStarTaskController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    dataStarTask.clear();
    var response = await sqlDb.rawreadData(
        "SELECT * FROM `startask`,`task` WHERE s_idtask=task.t_id");
    dataStarTask.addAll(response);
    update();
  }

  @override
  removeTaskFromStarTAsk(id) async {
    var response = await sqlDb.deleteData('startask', "`s_id`='$id'");
    if (response > 0) {
      Get.snackbar("Delete", "It was completed Delete Task");
      dataStarTask.removeWhere((element) => element['s_id'] == id);
    }
  }

  @override
  changecheckbox(id) async {
    if (dataStarTask == false) {
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
