import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/entities/project.dart';
import 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final GetProjects getProjectsUseCase;
  final int _limit = 8;

  int _page = 1;
  bool _isFetching = false;
  final List<Project> _projects = [];

  ProjectsCubit({required this.getProjectsUseCase}) : super(ProjectsInitial());

  Future<void> fetchProjects() async {
    if (_isFetching) return;

    _isFetching = true;
    if (_page == 1) emit(ProjectsLoading());

    try {
      final newProjects = await getProjectsUseCase(page: _page, limit: _limit);

      final hasReachedMax = newProjects.length < _limit;

      _projects.addAll(newProjects);

      emit(ProjectsLoaded(projects: _projects, hasReachedMax: hasReachedMax));
      if (!hasReachedMax) _page++;
    } catch (e) {
      emit(ProjectsError(e.toString()));
    }

    _isFetching = false;
  }

  void refreshProjects() {
    _page = 1;
    _projects.clear();
    fetchProjects();
  }
}
