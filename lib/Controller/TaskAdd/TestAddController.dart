import 'package:get/get.dart';
import 'package:todo/Data/source/local/Sqflite.dart';

abstract class AbsTaskaddController extends GetxController {
  //cat=>category

  late DateTime dateTime = DateTime.now();
  List catData = [];
  SqlDb sqlDb = SqlDb.instance;

  // getdata();
}

class Taskaddcontroller extends AbsTaskaddController {
  @override
  void onInit() {
    // getdata();
    super.onInit();
  }

  // @override
  // getdata() {
  //   catData = Get.arguments['catdata'];
  // }
}
