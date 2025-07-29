import '../entities/project.dart';
import '../repositories/project_repository.dart';

class GetProjects {
  final ProjectRepository repository;

  GetProjects(this.repository);

  Future<List<Project>> call({required int page, required int limit}) {
    return repository.getProjects(page: page, limit: limit);
  }
}
