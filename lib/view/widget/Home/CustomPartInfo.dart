import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/String/String.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';

class CustomPartInfo extends StatelessWidget {
  const CustomPartInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40.0.sp,
        right:40.0.sp,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50.0.sp,
            height: 50.0.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Appcolors.white,
            ),
            child: Icon(
              Icons.list_alt_rounded,
              color: Appcolors.blue,
              size: 35.0.sp,
            ),
          ),
          Text(
            StringApp.all,
            style: TextStyleApp.white30blod,
          ),
          GetBuilder<HomeController>(
            builder: (controller) => Text(
              '${controller.dataTask.length} Task',
              style: TextStyleApp.white20blod,
            ),
          ),
        ],
      ),
    );
  }
}
