import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Core/function/changewidgetAcLang.dart';
import 'package:todo/Core/localization/localization.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: changewidgetAcLang(
            const Icon(CupertinoIcons.arrow_right),
            const Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<Mylocalization> {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownMenu(
          hintText: '15'.tr,
          onSelected: (value) {
            controller.changelang(value);
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'ar', label: '24'.tr),
            DropdownMenuEntry(value: 'en', label: '25'.tr),
          ]),
    );
  }
}
