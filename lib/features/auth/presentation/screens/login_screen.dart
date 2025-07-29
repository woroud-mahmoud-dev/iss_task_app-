import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';
import 'package:iss_task_app/core/routing/routing.dart';
import 'package:iss_task_app/features/auth/presentation/cubit/login_state.dart';
import '../cubit/login_cubit.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _logInWithEmail() {
    context.read<LogInCubit>().logInWithEmail(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In', style: AppTextStyles.style32Bold(context)),
      ),
      body: BlocConsumer<LogInCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is LoginSuccess) {
            context.go(AppRoutes.home);
          }
        },
        builder: (context, state) {
          bool isLoading = state is LoginLoading;
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),
                  LoginForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    obscureText: _obscureText,
                    onToggleObscure: () =>
                        setState(() => _obscureText = !_obscureText),
                    onLogin: _logInWithEmail,
                    isLoading: isLoading, // Pass loading state to form
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
