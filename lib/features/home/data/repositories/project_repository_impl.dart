import 'package:faker/faker.dart';
import 'package:iss_task_app/core/constants/app_constants.dart';
import 'package:iss_task_app/core/constants/app_durations.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Faker faker = Faker();

  @override
  Future<List<Project>> getProjects({
    required int page,
    required int limit,
  }) async {
    await Future.delayed(AppDurations.kFakeDelay);

    final start = (page - 1) * limit;
    if (start >= AppConstants.maxProjects) return [];

    final end = (start + limit).clamp(0, AppConstants.maxProjects);

    return List.generate(end - start, (index) {
      final id = (start + index).toString();
      return _generateFakeProject(id);
    });
  }

  Project _generateFakeProject(String id) {
    final startDate = faker.date.dateTime(minYear: 2025, maxYear: 2026);
    final endDate = startDate.add(
      Duration(
        days: faker.randomGenerator.integer(
          AppConstants.maxDurationDays,
          min: AppConstants.minDurationDays,
        ),
      ),
    );

    final workHours = faker.randomGenerator.integer(
      AppConstants.maxWorkHours,
      min: AppConstants.minWorkHours,
    );

    return Project(
      id: id,
      name: faker.company.name(),
      description: faker.lorem.sentences(3).join(' '),
      imageUrl: "https://picsum.photos/seed/project$id/400/200",
      startDate: startDate,
      endDate: endDate,
      workHours: workHours,
      companyName: faker.company.name(),
    );
  }
}
