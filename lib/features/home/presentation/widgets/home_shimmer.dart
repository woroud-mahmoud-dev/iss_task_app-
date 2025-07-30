import 'package:flutter/material.dart';
import 'package:iss_task_app/features/home/presentation/widgets/shimmer_card.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) {
        final isPortrait = orientation == Orientation.portrait;

        // Portrait: 2 cols × 3 rows = 6 cards
        // Landscape: 4 cols × 2 rows = 8 cards
        final crossAxisCount = isPortrait ? 2 : 4;
        final itemCount = isPortrait ? 6 : 8;

        final spacing = 8.w;
        const childAspectRatio = 0.75;

        return GridView.builder(
          padding: EdgeInsets.all(spacing),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: itemCount,
          itemBuilder: (_, __) => const ShimmerCard(),
        );
      },
    );
  }
}
