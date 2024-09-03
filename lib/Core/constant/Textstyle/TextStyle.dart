import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

class TextStyleApp {
  static TextStyle white20blod = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.white,
  );

  static TextStyle white15blod = TextStyle(
    fontSize: 15.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.white,
  );

  static TextStyle white25blod = TextStyle(
    fontSize: 25.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.white,
  );
  static TextStyle black25blod = TextStyle(
    fontSize: 25.0.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.black,
  );

  static TextStyle black18normal = TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.normal,
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

  static TextStyle blue18normal = TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.normal,
    color: Appcolors.blue,
  );
  static TextStyle blue18normalopacity = TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.normal,
    color: Appcolors.blue.withOpacity(.3),
  );
}
