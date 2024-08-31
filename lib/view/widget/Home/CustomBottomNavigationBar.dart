import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/String/String.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homescreencontroller>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(10.0),
        color: Appcolors.turquoise,
        width: MediaQuery.of(context).size.width,
        height: 60.0.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(0);
              },
              iconData: FluentIcons.task_list_add_20_filled,
              text: StringApp.task,
              index: 0,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(1);
              },
              iconData: FluentIcons.calendar_12_regular,
              text: StringApp.calender,
              index: 1,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(2);
              },
              iconData: FluentIcons.person_12_filled,
              text: StringApp.mine,
              index: 2,
            ),
            DrawerButton(
              color: Appcolors.white,
              onPressed: () {
                controller.advancedDrawerController.showDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustombottomItemBar extends GetView<Homescreencontroller> {
  const CustombottomItemBar({
    super.key,
    required this.iconData,
    required this.text,
    required this.index,
    required this.onTap,
  });
  final IconData iconData;
  final String text;
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          height: 40.0.h,
          width: controller.currentindex == index ? 90.0.w : 10.0.w,
          alignment: Alignment.center,
          padding: EdgeInsets.all(5.0.r),
          decoration: BoxDecoration(
              color: controller.currentindex == index ? Appcolors.nyc : null,
              borderRadius: BorderRadius.circular(20.0.r)),
          duration: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                iconData,
                color: Appcolors.white,
              ),
              controller.currentindex == index
                  ? Text(
                      text,
                      style: TextStyleApp.black15blod,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
