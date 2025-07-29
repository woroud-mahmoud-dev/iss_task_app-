import 'package:get_it/get_it.dart';
import 'package:iss_task_app/features/home/data/repositories/project_repository_impl.dart';
import 'package:iss_task_app/features/home/domain/usecases/get_projects.dart';

import '../presentation/cubit/projects_cubit.dart';

final getIt = GetIt.instance;

Future<void> initProjectsDI() async {
  // Repository
  getIt.registerLazySingleton<ProjectRepositoryImpl>(
    () => ProjectRepositoryImpl(),
  );

  // UseCase
  getIt.registerLazySingleton<GetProjects>(
    () => GetProjects(getIt<ProjectRepositoryImpl>()),
  );

  // Cubit
  getIt.registerFactory<ProjectsCubit>(
    () => ProjectsCubit(getProjectsUseCase: getIt<GetProjects>()),
  );
}
