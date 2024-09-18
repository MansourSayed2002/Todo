import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/image/AppImage.dart';
import 'package:todo/view/widget/Home/Drawer/CustomContainerAllCategory.dart';
import 'package:todo/view/widget/Home/Drawer/CustomContainerdrawer.dart';

class CustomDrawerApp extends GetView<Homescreencontroller> {
  const CustomDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(APPImage.todo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomContainerdrawer(
                    sureicon2: false,
                    ontap: () {
                      controller.gotostartaskpage();
                    },
                    iconData: FluentIcons.star_12_filled,
                    title: '14'.tr,
                  ),
                  const CustomContainerAllCategory(),
                  CustomContainerdrawer(
                    sureicon2: false,
                    ontap: () {},
                    iconData: FluentIcons.paint_brush_12_filled,
                    title: '19'.tr,
                  ),
                  CustomContainerdrawer(
                    sureicon2: false,
                    ontap: () {
                      controller.gotoChooselang();
                    },
                    iconData: FluentIcons.local_language_28_regular,
                    title: '15'.tr,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
