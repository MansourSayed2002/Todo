import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/StarTask/StarTaskController.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/view/widget/StarTask/CustmCardStarTask.dart';

class StartaskView extends StatelessWidget {
  const StartaskView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Startaskcontroller>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          '14'.tr,
          style: TextStyleApp.black25blod,
        ),
      ),
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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GetBuilder<Startaskcontroller>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.dataStarTask.length,
          itemBuilder: (context, index) => CustomCardStarTask(
            subtitle: '${controller.dataStarTask[index]['t_note']}',
            title: '${controller.dataStarTask[index]['t_taskt']}',
            id: controller.dataStarTask[index]['s_id'],
            onPressed: (p0) {
              controller.removeTaskFromStarTAsk(
                  controller.dataStarTask[index]['s_id']);
            },
          ),
        );
      }),
    );
  }
}
