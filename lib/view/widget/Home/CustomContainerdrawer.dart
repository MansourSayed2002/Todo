import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';

class CustomContainerdrawer extends StatelessWidget {
  const CustomContainerdrawer({
    super.key,
    required this.iconData,
    required this.title,
    required this.ontap,
  });
  final IconData iconData;
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(
          left: 30.0.r,
        ),
        height: 70.0.h,
        child: Row(
          children: [
            Icon(
              iconData,
              color: Appcolors.nyc,
            ),
            SizedBox(
              width: 20.0.w,
            ),
            Text(
              title,
              style: TextStyleApp.black18blod,
            ),
          ],
        ),
      ),
    );
  }
}
