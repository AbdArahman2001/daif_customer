import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.onPressed, required this.child, this.color, this.width})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??MediaQuery.of(context).size.width * 0.9,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => color)),
        child: child,
      ),
    );
  }
}
