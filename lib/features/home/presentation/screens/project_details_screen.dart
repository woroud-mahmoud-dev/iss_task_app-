import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_dimensions.dart';
import 'package:iss_task_app/core/constants/app_padding.dart';
import 'package:iss_task_app/features/home/presentation/widgets/icon_info.dart';
import 'package:iss_task_app/features/home/presentation/widgets/project_dates.dart';
import 'package:iss_task_app/features/home/presentation/widgets/reuseable_image_widget.dart';
import '../../domain/entities/project.dart';

// Entry widget
class ProjectDetailsScreen extends StatelessWidget {
  final Project project;
  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Portrait: image on top; Landscape: image on left
    return Scaffold(
      appBar: AppBar(title: Text(project.name)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPadding.screen,
          child: isPortrait
              ? _buildPortrait(context)
              : _buildLandscape(context),
        ),
      ),
    );
  }

  Widget _buildPortrait(BuildContext c) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _ProjectImage(project: project, height: AppDimensions.hp(0.4)),
      SizedBox(height: AppDimensions.spaceLarge),
      const _SectionTitle('Description'),
      SizedBox(height: AppDimensions.spaceSmall),
      _ProjectDescription(project.description),
      SizedBox(height: AppDimensions.spaceLarge),
      ProjectDates(project: project),
      SizedBox(height: AppDimensions.spaceMedium),
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
  );

  Widget _buildLandscape(BuildContext c) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 4,
        child: _ProjectImage(project: project, height: AppDimensions.hp(0.6)),
      ),
      SizedBox(width: AppDimensions.spaceMedium),
      Expanded(
        flex: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle('Description'),
            SizedBox(height: AppDimensions.spaceSmall),
            _ProjectDescription(project.description),
            SizedBox(height: AppDimensions.spaceLarge),
            ProjectDates(project: project),
            SizedBox(height: AppDimensions.spaceMedium),
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
    ],
  );
}

class _ProjectImage extends StatelessWidget {
  final Project project;
  final double height;

  const _ProjectImage({required this.project, required this.height});

  @override
  Widget build(BuildContext context) {
    return ReusableImageWidget(
      imageUrl: project.imageUrl,
      height: height,
      width: double.infinity,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
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
        fontSize: 16.sp,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _ProjectDescription extends StatelessWidget {
  final String description;
  const _ProjectDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp, height: 1.4),
    );
  }
}
