import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';
import 'package:iss_task_app/core/constants/app_images.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';
import 'package:lottie/lottie.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(height: 10.h),
        Text('Welcome back', style: AppTextStyles.style20Bold(context)),
        SizedBox(height: 10.h),

        Text(
          'Please log in to continue',
          style: AppTextStyles.style17Bold(
            context,
          ).copyWith(color: AppColors.textSecondary),
        ),

        Center(
          child: Lottie.asset(
            AppImages.auth,
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            repeat: false,
          ),
        ),

        SizedBox(height: 5.h),
      ],
    );
  }
}
