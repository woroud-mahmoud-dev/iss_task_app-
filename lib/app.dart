import 'package:flutter/material.dart';
import 'package:iss_task_app/core/routing/app_router.dart';
import 'package:iss_task_app/core/theme/dark_theme.dart';
import 'package:iss_task_app/core/theme/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,

      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'ISS Task App',
      routerConfig: AppRouter.router,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final isLandscape = mediaQuery.orientation == Orientation.landscape;

        final modifiedScaler = isLandscape
            ? const TextScaler.linear(0.7)
            : mediaQuery.textScaler;

        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: modifiedScaler),
          child: child!,
        );
      },
    );
  }
}
