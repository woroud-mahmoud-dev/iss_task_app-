import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.obscureText,
    required this.label,
    this.keyboardType,
    this.suffixIcon,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final String label;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.style17Bold(context)),
        SizedBox(height: 8.h),
        TextFormField(
          obscureText: obscureText ?? false,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.emailAddress,
          style: AppTextStyles.style14Bold(
            context,
          ).copyWith(color: Colors.black87),
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 228, 238, 247),
            hintText: hintText,
            hintStyle: AppTextStyles.style12(
              context,
            ).copyWith(color: AppColors.textSecondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
