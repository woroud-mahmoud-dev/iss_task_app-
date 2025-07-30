import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle style10(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 10.sp,
  );
  static TextStyle style12(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 12.sp,
  );
  static TextStyle style14Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
  );
  static TextStyle style12Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
  );
  static TextStyle style14(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
  );
  static TextStyle style14Gray(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodyMedium?.color,
    fontSize: 14.sp,
  );
  static TextStyle style16(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    height: 0,
  );
  static TextStyle style16Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static TextStyle style17Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static TextStyle style18(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 18.sp,
    height: 0,
  );
  static TextStyle style18Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static TextStyle style20Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static TextStyle style20(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    height: 0,
  );
  static TextStyle style22Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static TextStyle style22(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodySmall?.color,
    fontSize: 22.sp,
    fontWeight: FontWeight.normal,
    height: 0,
  );
  static TextStyle style24Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodyLarge?.color,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle style26Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodyLarge?.color,
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle style32Bold(BuildContext context) => TextStyle(
    color: Theme.of(context).textTheme.bodyLarge?.color,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static BoxDecoration customWhiteDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );
}
