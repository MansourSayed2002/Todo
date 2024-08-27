import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

class TextStyleApp {
  static TextStyle white20blod = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.white,
  );

  static TextStyle white30blod = TextStyle(
    fontSize: 40.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.white,
  );
  static TextStyle black25blod = TextStyle(
    fontSize: 25.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.black,
  );

  static TextStyle black18blodthrough = TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.black.withOpacity(.3),
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle black18blod = TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.black,
  );

  static TextStyle desire13normal = TextStyle(
    fontSize: 13.0.sp,
    fontWeight: FontWeight.normal,
    color: Appcolors.desire,
  );
}
