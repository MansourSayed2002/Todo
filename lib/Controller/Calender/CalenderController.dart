import 'package:get/get.dart';

abstract class AbsCalenderController extends GetxController {
  DateTime day = DateTime.now();
  ondayselect(selectday, focuseday);
}

class Calendercontroller extends AbsCalenderController {
  @override
  ondayselect(selectday, focuseday) {
    day = selectday;
    update();
  }
}
