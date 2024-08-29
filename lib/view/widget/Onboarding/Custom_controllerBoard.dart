import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Onboarding/OnboardingController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';

import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/Core/constant/static/OnboardingData.dart';

class Custom_controllerBoard extends StatelessWidget {
  const Custom_controllerBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onboardingcontroller>(
      builder: (controller) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.all(4.0),
                  width: controller.currentindex == index ? 40.0 : 10.0,
                  height: 10,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: controller.currentindex == index
                        ? Appcolors.ntsc
                        : Appcolors.turquoise,
                  ),
                ),
              ),
            ),
            controller.currentindex == 2
                ? const Align(
                    alignment: Alignment.centerRight,
                    child: ButtonGO(index: 2),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ButtonGO extends GetView<Onboardingcontroller> {
  const ButtonGO({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoHomeScreenPage();
      },
      child: Container(
        width: 70.0.sp,
        height: 70.0.sp,
        alignment: Alignment.center,
        margin: EdgeInsets.all(20.0.sp),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Text(
          '4'.tr,
          style: TextStyleApp.white20blod,
        ),
      ),
    );
  }
}
