import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';
import 'package:iss_task_app/core/utils/validators.dart';
import 'package:iss_task_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:iss_task_app/features/auth/presentation/widgets/shared_evaluated_button.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback onToggleObscure;
  final VoidCallback onLogin;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.obscureText,
    required this.onToggleObscure,
    required this.onLogin,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTextField(
              label: 'Email address',
              hintText: 'Enter your email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.isValidEmail()) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            AuthTextField(
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: obscureText,
              controller: passwordController,
              suffixIcon: IconButton(
                color: AppColors.primary,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onToggleObscure,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 4.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  'Forgot password?',
                  style: AppTextStyles.style10(context),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            SharedEvaluatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus(); // Unfocus all text fields
                if (formKey.currentState!.validate()) {
                  onLogin();
                }
              },
              isLoading: isLoading,
              buttonText: 'Log In',
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text('OR', style: AppTextStyles.style10(context)),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 10.h),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Don’t have an account? Sign Up',
                  style: AppTextStyles.style10(context),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
