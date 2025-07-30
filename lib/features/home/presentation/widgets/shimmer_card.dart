import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image placeholder
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              ),
            ),

            // Text-line placeholders
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                children: List.generate(3, (_) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      height: 14.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
