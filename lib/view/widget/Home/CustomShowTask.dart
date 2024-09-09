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
        width: MediaQuery.of(context).size.width,
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
          return Column(
            children: List.generate(
              controller.dataTask.length,
              (index) => CustomCardTask(
                indexs: index,
                subtitle: '${controller.dataTask[index]['t_note']}',
                title: '${controller.dataTask[index]['t_taskt']}',
                onPressed: (p0) {
                  controller.deleteTask(controller.dataTask[index]['t_id']);
                },
                onPressed2: (p0) {
                  controller
                      .addtasktostartask(controller.dataTask[index]['t_id']);
                },
              ),
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
    required this.onPressed2,
    required this.indexs,
  });
  final String title;
  final String subtitle;
  final void Function(BuildContext)? onPressed;
  final void Function(BuildContext)? onPressed2;

  final int indexs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SlideableWidgetGlobal(
        onPressed2: onPressed2,
        onPressed: onPressed,
        widget: Container(
            margin: EdgeInsets.all(10.0.sp),
            width: MediaQuery.of(context).size.width,
            height: 60.0.sp,
            child: CheckboxListTile(
              value: controller.dataTask[indexs]["t_done"] == 0 ? false : true,
              onChanged: (value) {
                controller.changecheckbox(
                    controller.dataTask[indexs]["t_id"], indexs);
              },
              title: Text(
                title,
                style: controller.dataTask[indexs]['t_done'] == 1
                    ? TextStyleApp.black18blodthrough
                    : TextStyleApp.black18blod,
              ),
              subtitle: Text(
                subtitle,
                style: controller.dataTask[indexs]['t_done'] == 1
                    ? TextStyleApp.black18blodthrough
                    : TextStyleApp.black18blod,
              ),
            )),
      ),
    );
  }
}


//  CheckboxListTile(
//             onChanged = (value) {
             
//             value: ,
//            
//           ),