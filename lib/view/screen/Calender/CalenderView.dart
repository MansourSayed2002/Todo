import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/Controller/Calender/CalenderController.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Calendercontroller>();
    return Scaffold(
      body: GetBuilder<Calendercontroller>(builder: (controller) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: TableCalendar(
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                firstDay: DateTime.utc(1900, 1, 1),
                lastDay: DateTime.utc(3000, 1, 1),
                focusedDay: DateTime.now(),
                onDaySelected: controller.ondayselect,
                selectedDayPredicate: (day) => isSameDay(day, controller.day),
              ),
            ),
          ],
        );
      }),
    );
  }
}
