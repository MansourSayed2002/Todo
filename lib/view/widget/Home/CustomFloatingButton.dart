import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';

import 'package:todo/Core/constant/Colors/Colors.dart';

class CustomFloatingButton extends GetView<Homescreencontroller> {
  const CustomFloatingButton({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Appcolors.white,
      backgroundColor: Appcolors.blue,
      onPressed: () {
        controller.gototaskaddpage();
      },
      child: const Icon(
        Icons.add,
        color: Appcolors.white,
      ),
    );
  }
}
