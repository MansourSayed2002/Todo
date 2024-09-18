import 'package:get/get.dart';
import 'package:todo/Core/constant/image/AppImage.dart';
import 'package:todo/Core/Class/Onboarding/Onboarding.dart';

List<OnboardingDataModel> onboardingData = [
  OnboardingDataModel(
    button: false,
    image: APPImage.welcome,
    title: '1'.tr,
  ),
  OnboardingDataModel(
    button: false,
    image: APPImage.board2,
    title: '2'.tr,
  ),
  OnboardingDataModel(
    button: true,
    image: APPImage.board3,
    title: '3'.tr,
  ),
];
