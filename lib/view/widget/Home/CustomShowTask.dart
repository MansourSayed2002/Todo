import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/Core/shared/SlideableWidgetGlobal.dart';

class CustomShowTask extends StatelessWidget {
  const CustomShowTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0.sp),
        margin: EdgeInsets.only(top: 20.0.sp),
        decoration: BoxDecoration(
          color: Appcolors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0.sp),
            topRight: Radius.circular(20.0.sp),
          ),
        ),
        child: GetBuilder<HomeController>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.dataTask.length,
            itemBuilder: (context, index) => CustomCardTask(
              subtitle: '${controller.dataTask[index]['note']}',
              title: '${controller.dataTask[index]['taskt']}',
              id: controller.dataTask[index]['id'],
              onPressed: (p0) {
                controller.deleteTask(controller.dataTask[index]['id'], index);
              },
            ),
          );
        }),
      ),
    );
  }
}

class CustomCardTask extends StatelessWidget {
  const CustomCardTask({
    super.key,
    required this.subtitle,
    required this.title,
    required this.onPressed,
    required this.id,
  });
  final String title;
  final String subtitle;
  final void Function(BuildContext)? onPressed;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SlideableWidgetGlobal(
        onPressed: onPressed,
        widget: Container(
          margin: EdgeInsets.all(10.0.sp),
          width: MediaQuery.of(context).size.width,
          height: 60.0.sp,
          child: CheckboxListTile(
            onChanged: (value) {
              controller.changecheckbox(id);
            },
            value: controller.checkboxvalue,
            title: Text(
              title,
              style: controller.checkboxvalue == true
                  ? TextStyleApp.black18blodthrough
                  : TextStyleApp.black18blod,
            ),
            subtitle: Text(
              subtitle,
              style: controller.checkboxvalue == true
                  ? TextStyleApp.black18blodthrough
                  : TextStyleApp.black18blod,
            ),
          ),
        ),
      ),
    );
  }
}
