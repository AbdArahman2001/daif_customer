import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IndicatorCircleWidget extends StatelessWidget {
  const IndicatorCircleWidget({Key? key, required this.isActive, required this.activeColor, required this.inActiveColor, required this.activeWidth, required this.inActiveRadius}) : super(key: key);
final bool isActive;
final Color activeColor;
final Color inActiveColor;
final double activeWidth;
final double inActiveRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.5.w),
      width: isActive?activeWidth:inActiveRadius,
      height: inActiveRadius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: isActive?activeColor:inActiveColor,
      ),
    );
  }
}
