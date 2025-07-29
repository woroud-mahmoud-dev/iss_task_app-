import 'package:flutter/material.dart';
import 'package:iss_task_app/features/home/presentation/widgets/project_card.dart';
import '../../domain/entities/project.dart';
import '../widgets/shimmer_card.dart';

typedef ProjectTapCallback = void Function(Project project);

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  final bool hasReachedMax;
  final ScrollController scrollController;
  final ProjectTapCallback onProjectTap;

  const ProjectsGrid({
    super.key,
    required this.projects,
    required this.hasReachedMax,
    required this.scrollController,
    required this.onProjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: hasReachedMax ? projects.length : projects.length + 2,
      itemBuilder: (context, index) {
        if (index >= projects.length) {
          return const ShimmerCard();
        }
        final project = projects[index];
        return ProjectCard(
          project: project,
          onTap: () => onProjectTap(project),
        );
      },
    );
  }
}
