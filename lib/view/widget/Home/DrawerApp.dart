import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/String/String.dart';
import 'package:todo/view/widget/Home/CustomContainerdrawer.dart';

class CustomDrawerApp extends StatelessWidget {
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
              image: AssetImage('assets/Images/To DO.png'),
              fit: BoxFit.cover,
            )),
          ),
          CustomContainerdrawer(
            ontap: () {},
            iconData: FluentIcons.star_12_filled,
            title: StringApp.startask,
          ),
          const CustomContainerAllCategory(),
          CustomContainerdrawer(
            ontap: () {},
            iconData: FluentIcons.paint_brush_12_filled,
            title: StringApp.theme,
          ),
          CustomContainerdrawer(
            ontap: () {},
            iconData: FluentIcons.settings_16_filled,
            title: StringApp.settings,
          )
        ],
      ),
    );
  }
}

class CustomContainerAllCategory extends StatelessWidget {
  const CustomContainerAllCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homescreencontroller>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.only(right: 20.0.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainerdrawer(
                  ontap: () {},
                  iconData: Icons.category,
                  title: StringApp.category,
                ),
                InkWell(
                  onTap: () {
                    controller.chagecheck();
                  },
                  child: const Icon(Icons.arrow_drop_down_sharp),
                ),
              ],
            ),
            Container(
              width: controller.check == false ? 0.0 : double.infinity,
            ),
            const InkWell(),
            Divider(
              indent: 10.0.w,
              endIndent: 10.0.w,
            ),
          ],
        ),
      );
    });
  }
}
