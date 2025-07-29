import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/routing/router_generation_config.dart';

import 'package:meals_app/features/onboarding/on_boarding_services/on_boarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OnBoardingServices.initializeSharedPrefrencesStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Meals App',
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
