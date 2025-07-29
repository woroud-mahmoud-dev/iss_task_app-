import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';
import 'package:iss_task_app/core/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      if (context.mounted) {
        context.go(AppRoutes.login);
      } else {
        if (kDebugMode) {
          print('Context is not mounted, cannot navigate to login');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Projects', style: Theme.of(context).textTheme.titleLarge),
      centerTitle: false,
      actions: [
        TextButton.icon(
          onPressed: () => _handleLogout(context),
          iconAlignment: IconAlignment.end,
          icon: const Icon(Icons.logout, color: AppColors.primary),
          label: const Text(
            'Logout',
            style: TextStyle(color: AppColors.primary),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            minimumSize: const Size(0, kToolbarHeight),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
