import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/Core/services/Myservices.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Myservices myservices = Get.find();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              myservices.sharedPreferences.remove('lang');
              print(myservices.sharedPreferences.getString('lang'));
            },
            child: const Text('data')),
      ),
    );
  }
}
