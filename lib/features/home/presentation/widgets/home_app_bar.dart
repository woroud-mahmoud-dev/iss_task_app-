import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iss_task_app/core/constants/app_colors.dart';
import 'package:iss_task_app/core/constants/app_texts_styles.dart';
import 'package:iss_task_app/core/routing/routes.dart';
import 'package:iss_task_app/features/home/presentation/widgets/confirm_logout_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  Future<void> clearImageCacheOnLogout() async {
    await DefaultCacheManager().emptyCache();
  }

  Future<void> _handleLogout(BuildContext context) async {
    final shouldLogout =
        await showDialog<bool>(
          context: context,
          builder: (_) => const ConfirmLogoutDialog(),
        ) ??
        false;

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
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text('Projects', style: AppTextStyles.style24Bold(context)),
      ),
      centerTitle: false,
      actions: [
        TextButton.icon(
          onPressed: () => _handleLogout(context),
          iconAlignment: IconAlignment.end,
          icon: const Icon(Icons.logout, color: AppColors.primary, size: 22),
          label: Text(
            'Logout',
            style: AppTextStyles.style16Bold(
              context,
            ).copyWith(color: AppColors.primary),
          ),

          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            minimumSize: const Size(0, kToolbarHeight),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
