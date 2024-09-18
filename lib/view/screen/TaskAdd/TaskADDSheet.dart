import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

import 'package:todo/Core/shared/TextFormFieldGlobal.dart';
import 'package:todo/view/widget/TaskAdd/CustomButtonCreate.dart';
import 'package:todo/view/widget/TaskAdd/Dialog.dart';

class TaskADDSheet extends GetView<Homescreencontroller> {
  const TaskADDSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250.h,
      decoration: BoxDecoration(
          color: Appcolors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0.r),
            topRight: Radius.circular(20.0.r),
          )),
      child: Column(
        children: [
          Textformfieldglobal(
            hint: '18'.tr,
            fillcolor: Appcolors.clouds,
            controller: controller.formtast,
          ),
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: const CustomIconbottoms(),
          ),
          const CustomButtonCreate(),
        ],
      ),
    );
  }
}

class CustomIconbottoms extends GetView<Homescreencontroller> {
  const CustomIconbottoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // controller.showdate(context);
          },
          child: const Icon(
            Icons.date_range_outlined,
            color: Appcolors.blue,
          ),
        ),
        const SizedBox(
          width: 25.0,
        ),
        Dialo(
          controller: controller.note,
          hint: '8'.tr,
          onconfirm: () {
            Get.back();
          },
          title: '23'.tr,
          widget: const Icon(
            Icons.note_alt_outlined,
            color: Appcolors.blue,
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        GetBuilder<Homescreencontroller>(builder: (controller) {
          return PopupMenuButton(
              icon: const Icon(
                Icons.category,
                color: Appcolors.blue,
              ),
              itemBuilder: (context) => [
                    ...List.generate(
                      controller.catData.length,
                      (index) => PopupMenuItem(
                        onTap: () {
                          controller
                              .choosecat(controller.catData[index]['c_id']);
                        },
                        child: Text("${controller.catData[index]['c_categ']}"),
                      ),
                    ),
                  ]);
        })
      ],
    );
  }
}
