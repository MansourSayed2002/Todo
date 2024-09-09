import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textformfieldglobal extends StatelessWidget {
  const Textformfieldglobal({
    super.key,
    required this.hint,
    required this.fillcolor,
    required this.controller,
  });
  final String hint;
  final Color fillcolor;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0.r),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(25.0.r),
          hintText: hint,
          filled: true,
          fillColor: fillcolor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        controller: controller,
      ),
    );
  }
}
