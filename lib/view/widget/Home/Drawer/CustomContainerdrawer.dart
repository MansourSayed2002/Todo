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
    this.iconData2,
    required this.sureicon2,
  });
  final IconData iconData;
  final IconData? iconData2;
  final bool sureicon2;
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(20.0.r),
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
            const Spacer(),
            sureicon2 == true
                ? Icon(
                    iconData2,
                    color: Appcolors.black,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
