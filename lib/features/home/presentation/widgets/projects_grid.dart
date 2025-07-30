import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_dimensions.dart';
import 'package:iss_task_app/features/home/presentation/widgets/project_card.dart';
import '../../domain/entities/project.dart';
import '../widgets/shimmer_card.dart';

typedef ProjectTapCallback = void Function(Project project);

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final ScrollController scrollController;
  final ProjectTapCallback onProjectTap;

  const ProjectsGrid({
    super.key,
    required this.projects,
    required this.hasReachedMax,
    required this.isLoadingMore,
    required this.scrollController,
    required this.onProjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        final crossAxisCount = isPortrait ? 2 : 4;

        final placeholderCount = (!hasReachedMax && isLoadingMore)
            ? crossAxisCount
            : 0;

        final visibleCount = projects.length;
        final totalCount = visibleCount + placeholderCount;

        final spacing = AppDimensions.kRawSpacing.w;

        return GridView.builder(
          controller: scrollController,
          padding: EdgeInsets.all(spacing),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: AppDimensions.kAspectRatio,
          ),
          itemCount: totalCount,
          itemBuilder: (_, idx) {
            if (idx < visibleCount) {
              final project = projects[idx];
              return ProjectCard(
                project: project,
                onTap: () => onProjectTap(project),
              );
            }
            return const ShimmerCard();
          },
        );
      },
    );
  }
}
