import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/features/home/presentation/widgets/icon_info.dart';
import 'package:iss_task_app/features/home/presentation/widgets/project_dates.dart';
import '../../domain/entities/project.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProjectImage(project: project),
            const SizedBox(height: 24),
            const _SectionTitle('Description'),
             SizedBox(height: 8.h),
            _ProjectDescription(description: project.description),
             SizedBox(height: 24.h),
            ProjectDates(project: project),
             SizedBox(height: 16.h),
            IconInfoRow(
              icon: Icons.access_time,
              label: 'Work Hours',
              value: '${project.workHours} hours',
            ),
            IconInfoRow(
              icon: Icons.business,
              label: 'Company Name',
              value: project.companyName,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final Project project;

  const _ProjectImage({required this.project});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        project.imageUrl,
        height: MediaQuery.of(context).size.width * 0.8,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: MediaQuery.of(context).size.width * 0.8,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const Icon(Icons.broken_image),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _ProjectDescription extends StatelessWidget {
  final String description;

  const _ProjectDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(description, style: Theme.of(context).textTheme.bodyMedium);
  }
}

