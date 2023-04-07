import 'package:daif_customer/utill/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({Key? key, required this.image, required this.title}) : super(key: key);
final String image;
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      margin: EdgeInsets.symmetric( horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).dialogBackgroundColor,
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Image.asset(image),
          ),
          SizedBox(width: 10.w,),
          Text(title,style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
