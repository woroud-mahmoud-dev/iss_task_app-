import 'package:iss_task_app/core/di/service_locator.dart';
import 'package:iss_task_app/features/auth/data/datasources/local_auth_data_source.dart';
import 'package:iss_task_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:iss_task_app/features/auth/domain/repositories/auh_repository.dart';
import 'package:iss_task_app/features/auth/domain/useCases/login_with_email.dart';
import 'package:iss_task_app/features/auth/presentation/cubit/login_cubit.dart';

Future<void> initAuthDI() async {
  getIt.registerLazySingleton<LocalAuthDataSource>(
    () => LocalAuthDataSourceImpl(sharedPrefs: getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localDataSource: getIt()),
  );
  getIt.registerLazySingleton<LogInWithEmailUseCase>(
    () => LogInWithEmailUseCase(getIt()),
  );
  getIt.registerFactory<LogInCubit>(() => LogInCubit(getIt()));
}
