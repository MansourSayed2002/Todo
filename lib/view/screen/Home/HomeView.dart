import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/view/widget/Home/CustomPartInfo.dart';
import 'package:todo/view/widget/Home/CustomShowTask.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Appcolors.white,
        backgroundColor: Appcolors.blue,
        onPressed: () {
          controller.gototaskaddpage();
        },
        child: const Icon(
          Icons.add,
          color: Appcolors.white,
        ),
      ),
      backgroundColor: Appcolors.blue,
      body: const CustomBody(),
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
