import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';

import '../../../../core/constants/app_colors.dart';

class SharedEvaluatedButton extends StatelessWidget {
  const SharedEvaluatedButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.isLoading,
  });
  final void Function()? onPressed;
  final String buttonText;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: theme.elevatedButtonTheme.style,
      child: SizedBox(
        height: 24.h,
        child: Center(
          child: Text(
            isLoading == true ? 'Loading...' : buttonText,
            style: AppTextStyles.style14Bold(
              context,
            ).copyWith(color: AppColors.surface),
          ),
        ),
      ),
    );
  }
}
