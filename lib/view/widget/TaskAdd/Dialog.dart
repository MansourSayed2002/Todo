import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/String/String.dart';

class Dialo extends StatelessWidget {
  const Dialo({
    super.key,
    required this.iconData,
    required this.controller,
    required this.title,
  });
  final IconData iconData;
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: StringApp.addnote,
          content: TextFormField(
            controller: controller,
          ),
          textCancel: StringApp.cancel,
          textConfirm: StringApp.save,
          onConfirm: () {
            Get.back();
            Get.snackbar('Done', 'Done Save');
          },
          onCancel: () {
            controller.clear();
          },
        );
      },
      child: Icon(
        iconData,
        color: Appcolors.blue,
      ),
    );
  }
}
