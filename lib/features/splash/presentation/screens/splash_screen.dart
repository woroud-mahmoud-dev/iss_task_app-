import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_task_app/core/constants/app_durations.dart';
import 'package:iss_task_app/core/constants/app_strings.dart';
import 'package:iss_task_app/core/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/animated_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    try {
      await Future.delayed(AppDurations.kSplashDuration);
      if (!mounted) return;

      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (!mounted) return;
      context.go(isLoggedIn ? AppRoutes.home : AppRoutes.login);
    } catch (e) {
      debugPrint('Splash screen error: $e');
      if (mounted) {
        setState(() => _hasError = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          const Center(child: AnimatedLogo(beginScale: 0.8, endScale: 1.0)),
          if (_hasError)
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  AppStrings.splashError,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
