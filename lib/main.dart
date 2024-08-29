import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/Core/constant/Routing/Routing.dart';
import 'package:todo/Core/localization/Translation.dart';
import 'package:todo/Core/localization/localization.dart';
import 'package:todo/Core/services/Myservices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservices();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    Mylocalization controller = Get.put(Mylocalization());
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: controller.language,
            translations: Mytranslation(),
            initialRoute: '/',
            // home: const HomeScreentest(),
            getPages: getPages,
          );
        });
  }
}
