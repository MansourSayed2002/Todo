import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Onboarding/OnboardingController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/Core/constant/static/OnboardingData.dart';

class Custom_explainBoard extends GetView<Onboardingcontroller> {
  const Custom_explainBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.chageindex(value);
        },
        itemCount: onboardingData.length,
        itemBuilder: (context, index) => SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Appcolors.white,
                radius: 150,
                backgroundImage: AssetImage(onboardingData[index].image),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  onboardingData[index].title,
                  style: TextStyleApp.white20blod,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
