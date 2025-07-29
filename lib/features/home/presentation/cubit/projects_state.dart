import '../../domain/entities/project.dart';

abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<Project> projects;
  final bool hasReachedMax;

  ProjectsLoaded({required this.projects, required this.hasReachedMax});
}

class ProjectsError extends ProjectsState {
  final String message;

  ProjectsError(this.message);
}
