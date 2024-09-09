import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todo/Controller/StarTask/StarTaskController.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';

class CustomCardStarTask extends StatelessWidget {
  const CustomCardStarTask({
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
    return GetBuilder<Startaskcontroller>(
      builder: (controller) => Container(
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
    );
  }
}
