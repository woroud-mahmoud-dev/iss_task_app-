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
        centerTitle: false,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text('Log In', style: AppTextStyles.style24Bold(context)),
        ),
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
            child: OrientationBuilder(
              builder: (context, orientation) {
                final isPortrait = orientation == Orientation.portrait;

                return SingleChildScrollView(
                  padding: isPortrait
                      ? EdgeInsets.symmetric(horizontal: 18.w)
                      : EdgeInsets.symmetric(horizontal: 8.w),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          MediaQuery.of(context).size.height - kToolbarHeight,
                    ),
                    child: IntrinsicHeight(
                      child: isPortrait
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Expanded(flex: 2, child: LoginHeader()),
                                Expanded(
                                  flex: 4,
                                  child: LoginForm(
                                    formKey: _formKey,
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                    obscureText: _obscureText,
                                    onToggleObscure: () => setState(
                                      () => _obscureText = !_obscureText,
                                    ),
                                    onLogin: _logInWithEmail,
                                    isLoading: isLoading,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(child: LoginHeader()),
                                Expanded(
                                  child: LoginForm(
                                    formKey: _formKey,
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                    obscureText: _obscureText,
                                    onToggleObscure: () => setState(
                                      () => _obscureText = !_obscureText,
                                    ),
                                    onLogin: _logInWithEmail,
                                    isLoading: isLoading,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
