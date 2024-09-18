import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';

import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/view/screen/TaskAdd/TaskADDSheet.dart';

class CustomFloatingButton extends GetView<Homescreencontroller> {
  const CustomFloatingButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Appcolors.white,
      backgroundColor: Appcolors.nyc,
      onPressed: () {
        print(Get.deviceLocale);
        Get.bottomSheet(const TaskADDSheet());
      },
      child: const Icon(
        Icons.add,
        color: Appcolors.white,
      ),
    );
  }
}
