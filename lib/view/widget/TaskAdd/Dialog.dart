import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/Core/shared/TextFormFieldGlobal.dart';

class Dialo extends StatelessWidget {
  const Dialo({
    super.key,
    required this.widget,
    required this.controller,
    required this.title,
    required this.hint,
    required this.onconfirm,
  });
  final Widget widget;
  final TextEditingController controller;
  final String title;
  final String hint;
  final VoidCallback onconfirm;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.defaultDialog(
            title: title,
            titleStyle: TextStyleApp.black18blod,
            backgroundColor: Appcolors.white,
            content: SizedBox(
                width: 400.0.w,
                child: Textformfieldglobal(
                  hint: hint,
                  fillcolor: Appcolors.clouds,
                  controller: controller,
                )),
            textCancel: '10'.tr,
            textConfirm: '11'.tr,
            onConfirm: onconfirm,
            onCancel: () {
              controller.clear();
            },
          );
        },
        child: widget);
  }
}
