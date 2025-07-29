import 'package:flutter/material.dart';
import 'package:iss_task_app/core/constants/app_durations.dart';
import 'package:iss_task_app/core/constants/app_images.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key, this.beginScale = 0.8, this.endScale = 1.0});

  final double beginScale;
  final double endScale;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: AppDurations.kSplashDuration,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: beginScale + ((endScale - beginScale) * value),
            child: child,
          ),
        );
      },
      child: Image.asset(
        AppImages.issLogo,
        width: size.width * 0.3,
        height: size.height * 0.3,
        fit: BoxFit.contain,
      ),
    );
  }
}
