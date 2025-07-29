import 'package:get_it/get_it.dart';
import 'package:iss_task_app/features/auth/di/auth_di.dart';
import 'package:iss_task_app/features/home/di/home_di.dart';

import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
Future<void> setup() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // Features

  await initAuthDI();
  await initProjectsDI();
}
