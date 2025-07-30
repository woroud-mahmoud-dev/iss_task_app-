import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static const Size designSize = Size(375, 812);

  static double wp(double percent) => ScreenUtil().screenWidth * percent;

  static double hp(double percent) => ScreenUtil().screenHeight * percent;

  static double radiusSmall = 8.r;
  static double radiusMedium = 12.r;
  static double spaceSmall = 8.h;
  static double spaceMedium = 16.h;
  static double spaceLarge = 24.h;
  static const double kRawSpacing = 8;
  static const double kAspectRatio = 0.75;
}
