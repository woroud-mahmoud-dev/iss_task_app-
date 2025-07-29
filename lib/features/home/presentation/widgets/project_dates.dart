import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iss_task_app/features/home/domain/entities/project.dart';
import 'package:iss_task_app/features/home/presentation/widgets/icon_info.dart';

class ProjectDates extends StatelessWidget {
  final Project project;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  ProjectDates({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconInfoRow(
          icon: Icons.calendar_today,
          label: 'Start Date',
          value: formatter.format(project.startDate),
        ),
        IconInfoRow(
          icon: Icons.event,
          label: 'End Date',
          value: formatter.format(project.endDate),
        ),
      ],
    );
  }
}
