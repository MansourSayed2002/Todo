import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/test.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return GetBuilder<Testcontroller>(
      builder: (controller) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${controller.count}'),
            ElevatedButton(
                onPressed: () {
                  controller.changecount();
                },
                child: const Text('data'))
          ],
        ),
      ),
    );
  }
}
