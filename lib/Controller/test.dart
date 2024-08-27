import 'package:get/get.dart';

class Testcontroller extends GetxController {
  var count = 0;

  changecount() {
    count++;
    update();
  }
}
