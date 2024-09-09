import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/Controller/Home/HomeScreenController.dart';
import 'package:todo/Core/constant/Colors/Colors.dart';
import 'package:todo/Core/constant/String/String.dart';
import 'package:todo/Core/constant/Textstyle/TextStyle.dart';
import 'package:todo/view/widget/Home/Drawer/CustomContainerdrawer.dart';
import 'package:todo/view/widget/TaskAdd/Dialog.dart';

class CustomContainerAllCategory extends StatelessWidget {
  const CustomContainerAllCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homescreencontroller>(builder: (controller) {
      return Column(
        children: [
          CustomContainerdrawer(
            sureicon2: true,
            iconData2: Icons.arrow_drop_down_sharp,
            ontap: () => controller.chagecheck(),
            iconData: Icons.category,
            title: StringApp.category,
          ),
          controller.check == true
              ? Column(
                  children: [
                    ...List.generate(
                      controller.catData.length,
                      (index) => Padding(
                        padding: EdgeInsets.all(10.0.r),
                        child: Row(
                          children: [
                            Icon(
                              Icons.list_alt_outlined,
                              size: 20.0.sp,
                            ),
                            SizedBox(
                              width: 20.0.w,
                            ),
                            Text(
                              controller.catData[index]['c_categ'],
                              style: TextStyleApp.black18normal,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                controller.deletecat(
                                    controller.catData[index]['c_id']);
                              },
                              child: Icon(
                                Icons.delete_forever_outlined,
                                size: 25.0.sp,
                                color: Appcolors.desire,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Dialo(
                      controller: controller.category,
                      hint: StringApp.inputhere,
                      title: StringApp.createnewcategory,
                      onconfirm: () {
                        controller.addDatacat();
                      },
                      widget: Padding(
                        padding: EdgeInsets.all(20.0.r),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: Appcolors.nyc,
                            ),
                            SizedBox(
                              width: 20.0.w,
                            ),
                            Text(
                              StringApp.createnew,
                              style: TextStyleApp.black18blod,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          Divider(
            indent: 10.0.w,
            endIndent: 10.0.w,
          ),
        ],
      );
    });
  }
}
