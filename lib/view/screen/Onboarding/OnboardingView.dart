import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Onboarding/OnboardingController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/view/widget/Onboarding/Custom_controllerBoard.dart';
import 'package:todo/view/widget/Onboarding/Custom_explainBoard.dart';

class Onboardingview extends StatelessWidget {
  const Onboardingview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Onboardingcontroller>();
    return Scaffold(
      backgroundColor: Appcolors.bluehorizon,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Custom_explainBoard(),
            Custom_controllerBoard(),
          ],
        ),
      ),
    );
  }
}
