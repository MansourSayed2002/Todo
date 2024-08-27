import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/TaskAdd/TestAddController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

class CustomTextfield extends GetView<Taskaddcontroller> {
  const CustomTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.r),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0.r),
            child: AutoSizeTextField(
              controller: controller.autosize,
              style: TextStyle(fontSize: 20.sp),
              cursorColor: Appcolors.blue,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(20.r)),
            ),
          ),
        ],
      ),
    );
  }
}
