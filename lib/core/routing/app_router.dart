import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_task_app/core/di/service_locator.dart';
import 'package:iss_task_app/core/routing/routes.dart';
import 'package:iss_task_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:iss_task_app/features/auth/presentation/screens/login_screen.dart';
import 'package:iss_task_app/features/home/domain/entities/project.dart';
import 'package:iss_task_app/features/home/presentation/cubit/projects_cubit.dart';
import 'package:iss_task_app/features/home/presentation/screens/home.dart';
import 'package:iss_task_app/features/home/presentation/screens/project_details_screen.dart';

import 'package:iss_task_app/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => ProjectsCubit(getProjectsUseCase: getIt()),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<LogInCubit>(),
          child: const LogInScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.projectDetails,
        builder: (context, state) {
          final project = state.extra as Project;
          return ProjectDetailsScreen(project: project);
        },
      ),

    ],
  );
}
