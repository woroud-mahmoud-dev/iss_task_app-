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
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: 12.h),
          ),
          textStyle: WidgetStateProperty.all(
            AppTextStyles.style14Bold(
              context,
            ).copyWith(color: AppColors.surface, fontSize: 14.sp),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,

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
