import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/view/widget/Home/CustomBottomNavigationBar.dart';
import 'package:todo/view/widget/Home/Drawer/DrawerApp.dart';

class Homescreenview extends StatelessWidget {
  const Homescreenview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Homescreencontroller>();
    return GetBuilder<Homescreencontroller>(builder: (controller) {
      return AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Appcolors.turquoise, Appcolors.bluehorizon]),
            ),
          ),
          controller: controller.advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          drawer: const CustomDrawerApp(),
          child: Scaffold(
            bottomNavigationBar: const CustomBottomNavigationBar(),
            body: controller.screens.elementAt(controller.currentindex),
          ));
    });
  }
}
