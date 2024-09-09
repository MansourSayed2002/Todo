import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';

abstract class AbsCalenderController extends GetxController {
  DateTime dateTime = DateTime.now();
  SqlDb sqlDb = SqlDb.instance;
  List dataTask = [];
  getData(day);
}

class Calendercontroller extends AbsCalenderController {
  @override
  void onInit() {
    getData(dateTime);
    super.onInit();
  }

  @override
  getData(day) async {
    dataTask.clear();
    var date = day.toString().split(' ')[0];
    var response = await sqlDb.readData("task", "`t_date`='$date'");
    dataTask.addAll(response);
    update();
  }
}
