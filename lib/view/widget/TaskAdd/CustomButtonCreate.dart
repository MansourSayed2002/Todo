import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';

class CustomButtonCreate extends GetView<Homescreencontroller> {
  const CustomButtonCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          controller.create();
        },
        child: Container(
          margin: EdgeInsets.only(top: 5.0.r),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 60.0.h,
          color: Appcolors.bluehorizon,
          child: Text(
            '7'.tr,
            style: TextStyleApp.white20blod,
          ),
        ),
      ),
    );
  }
}
