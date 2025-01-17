import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/view/widget/Home/CustomFloatingButton.dart';
import 'package:todo/view/widget/Home/CustomPartInfo.dart';
import 'package:todo/view/widget/Home/CustomShowTask.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return const Scaffold(
      floatingActionButton: CustomFloatingButton(),
      backgroundColor: Appcolors.turquoise,
      body: CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        children: [
          CustomPartInfo(),
          CustomShowTask(),
        ],
      ),
    );
  }
}
