import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/Core/Class/AppRoute/AppRoute.dart';
import 'package:todo/Core/Class/middleware/middleware.dart';
import 'package:todo/view/screen/Home/HomeView.dart';
import 'package:todo/view/screen/Onboarding/OnboardingView.dart';
import 'package:todo/view/screen/TaskAdd/TaskAdd.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoute.onboarding,
    page: () => const Onboardingview(),
    middlewares: [
      MyMiddleware(),
    ],
  ),
  GetPage(name: AppRoute.taskaddview, page: () => const TaskADDView()),
  GetPage(name: AppRoute.homeview, page: () => const Homeview()),
];
