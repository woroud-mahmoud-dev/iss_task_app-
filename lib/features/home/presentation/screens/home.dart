import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_task_app/core/routing/routes.dart';
import 'package:iss_task_app/features/home/presentation/widgets/empty_state_widget.dart';
import 'package:iss_task_app/features/home/presentation/widgets/error_state_widget.dart';
import 'package:iss_task_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:iss_task_app/features/home/presentation/widgets/home_shimmer.dart';
import 'package:iss_task_app/features/home/presentation/widgets/projects_grid.dart';
import '../cubit/projects_cubit.dart';
import '../cubit/projects_state.dart';
import '../../domain/entities/project.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadInitialProjects();
    _setupScrollListener();
  }

  void _loadInitialProjects() {
    context.read<ProjectsCubit>().fetchProjects();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      final cubit = context.read<ProjectsCubit>();
      final state = cubit.state;
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoadingMore &&
          state is ProjectsLoaded &&
          !state.hasReachedMax) {
        _loadMoreProjects();
      }
    });
  }

  Future<void> _loadMoreProjects() async {
    setState(() => _isLoadingMore = true);
    await context.read<ProjectsCubit>().fetchProjects();
    setState(() => _isLoadingMore = false);
  }

  void _navigateToDetails(Project project) {
    context.push(AppRoutes.projectDetails, extra: project);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<ProjectsCubit, ProjectsState>(
        builder: (context, state) {
          // very first load
          if (state is ProjectsLoading && state is! ProjectsLoaded) {
            return const HomeShimmer();
          }

          // loaded (possibly empty)
          if (state is ProjectsLoaded) {
            if (state.projects.isEmpty) {
              return EmptyStateWidget(onRefresh: _loadInitialProjects);
            }

            return ProjectsGrid(
              projects: state.projects,
              hasReachedMax: state.hasReachedMax,
              isLoadingMore: _isLoadingMore,
              scrollController: _scrollController,
              onProjectTap: _navigateToDetails,
            );
          }

          // error
          if (state is ProjectsError) {
            return ErrorState(
              message: state.message,
              onRetry: _loadInitialProjects,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
