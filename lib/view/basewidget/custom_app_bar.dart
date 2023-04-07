import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, this.leading, this.actions}) : super(key: key);
  final String title;
  final Widget? leading;
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      leading:leading?? IconButton(
        icon: const Icon(Icons.sort),
        onPressed: () {},
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
       actions?? IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22.r),
              bottomRight: Radius.circular(22.r))),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 70.h);
}
