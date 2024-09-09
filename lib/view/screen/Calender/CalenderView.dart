import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/Controller/Calender/CalenderController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/Core/function/Funlanguage.dart';
import 'package:todo/view/widget/Home/CustomFloatingButton.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Calendercontroller>();
    return Scaffold(
      floatingActionButton: const CustomFloatingButton(),
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
                onDaySelected: (selectedDay, focusedDay) {
                  controller.dateTime = selectedDay;
                  controller.getData(selectedDay);
                  controller.update();
                },
                selectedDayPredicate: (day) =>
                    isSameDay(day, controller.dateTime),
              ),
            ),
            ...List.generate(
              controller.dataTask.length,
              (index) => Container(
                margin: EdgeInsets.all(10.0.r),
                padding: EdgeInsets.all(20.0.r),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Appcolors.clouds,
                    borderRadius: BorderRadius.circular(10.0.r),
                    border: langaugeWidgetApp(
                      Border(
                        right: BorderSide(
                          width: 15.0.w,
                          color: Appcolors.nyc,
                        ),
                      ),
                      Border(
                        left: BorderSide(
                          width: 15.0.w,
                          color: Appcolors.nyc,
                        ),
                      ),
                    )),
                child: Text(
                  '${controller.dataTask[index]['t_taskt']}',
                  style: TextStyleApp.black18blod,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
