import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/TaskAdd/TestAddController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/String/String.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/view/widget/TaskAdd/Dialog.dart';

class CustomInfoTask extends StatelessWidget {
  const CustomInfoTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Taskaddcontroller>(builder: (controller) {
      return Positioned(
        bottom: 0.0,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250.0.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  color: Appcolors.black,
                  indent: 20.0.sp,
                  endIndent: 20.0.sp,
                ),
                ListTile(
                  title: Text(
                      "${controller.dateTime.day}-${controller.dateTime.month}-${controller.dateTime.year} ${controller.dateTime.hour}:${controller.dateTime.minute}"),
                  leading: InkWell(
                    onTap: () {
                      controller.showdate(context);
                    },
                    child: const Icon(
                      Icons.date_range_outlined,
                      color: Appcolors.blue,
                    ),
                  ),
                ),
                ListTile(
                    title: Text(StringApp.addnote),
                    leading: Dialo(
                      controller: controller.note,
                      iconData: Icons.note_alt_outlined,
                      title: StringApp.addnote,
                    )),
                ListTile(
                    title: Text(StringApp.category),
                    leading: Dialo(
                      controller: controller.cat,
                      iconData: Icons.category_rounded,
                      title: StringApp.category,
                    )),
                const CustomButtonCreate(),
              ],
            )),
      );
    });
  }
}

class CustomButtonCreate extends GetView<Taskaddcontroller> {
  const CustomButtonCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.create();
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.0.r),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 60.0.h,
        color: Appcolors.blue,
        child: Text(
          StringApp.create,
          style: TextStyleApp.white20blod,
        ),
      ),
    );
  }
}
