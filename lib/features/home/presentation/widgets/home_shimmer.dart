import 'package:flutter/material.dart';
import 'package:iss_task_app/features/home/presentation/widgets/shimmer_card.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: 6, // Even number for grid layout
      itemBuilder: (context, index) => const ShimmerCard(),
    );
  }
}
