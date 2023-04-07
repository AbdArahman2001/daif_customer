import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utill/color_manager.dart';
class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const EmptyAppBar({Key? key, this.height}) : super(key: key);
final double? height;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight:height?? 20.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.backgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: ColorManager.backgroundColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, height??20.h);
}
