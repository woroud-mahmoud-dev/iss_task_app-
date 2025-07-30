import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/app.dart';
import 'package:iss_task_app/core/constants/app_dimensions.dart';
import 'package:iss_task_app/core/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    ScreenUtilInit(
      designSize: AppDimensions.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => const MyApp(),
    ),
  );
}
