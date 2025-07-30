import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iss_task_app/features/home/presentation/widgets/reuseable_image_widget.dart';
import '../../domain/entities/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectCard({super.key, required this.project, required this.onTap});

  static const double _cardElevation = 3;
  static const double _cardMargin = 8;
  static const double _borderRadius = 12;
  static const double _imageHeight = 120;
  static const double _labelSpacing = 4;

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat.yMMMd();

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: _cardElevation,
        margin: EdgeInsets.all(_cardMargin.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // IMAGE OR ICON
            Expanded(
              flex: 4,
              child: ReusableImageWidget(
                imageUrl: project.imageUrl,
                height: _imageHeight.h,
                width: double.infinity,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(_borderRadius.r),
                ),
              ),
            ),
            // DETAILS
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(_cardMargin.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        project.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: _labelSpacing.h),
                    Flexible(
                      child: Text(
                        'Start: ${formatter.format(project.startDate.toLocal())}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'End:   ${formatter.format(project.endDate.toLocal())}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
