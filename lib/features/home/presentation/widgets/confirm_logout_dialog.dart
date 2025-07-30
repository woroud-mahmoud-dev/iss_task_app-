import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmLogoutDialog extends StatelessWidget {
  const ConfirmLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Responsive title text
      title: Text(
        'Confirm Logout',
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),

      // Responsive content text
      content: Text(
        'Are you sure you want to log out?',
        style: TextStyle(fontSize: 14.sp),
      ),

      // Responsive padding around the buttons
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),

      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          ),
          child: Text('Cancel', style: TextStyle(fontSize: 14.sp)),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          ),
          child: Text('Logout', style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
