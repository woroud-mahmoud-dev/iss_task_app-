import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_images.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';
import 'package:lottie/lottie.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'Welcome back',
          style: AppTextStyles.style18Bold(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 14.h),

        Text(
          'Please log in to continue',
          style: AppTextStyles.style12(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),

        Center(
          child: Lottie.asset(
            AppImages.auth,
            height: MediaQuery.of(context).size.height * 0.25,
            repeat: false,
          ),
        ),

        SizedBox(height: 10.h),
      ],
    );
  }
}
