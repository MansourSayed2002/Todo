import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/TaskAdd/TestAddController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/String/String.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/view/widget/TaskAdd/CustomInfoTask.dart';
import 'package:todo/view/widget/TaskAdd/CustomTextfield.dart';

class TaskADDView extends StatelessWidget {
  const TaskADDView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Taskaddcontroller>();
    return Scaffold(
      backgroundColor: Appcolors.clouds,
      appBar: AppBar(
        backgroundColor: Appcolors.clouds,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          StringApp.newtask,
          style: TextStyleApp.black25blod,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                StringApp.plan,
                style: TextStyleApp.black18blod,
              ),
            ),
            const CustomTextfield(),
            const CustomInfoTask(),
          ],
        ),
      ),
    );
  }
}
