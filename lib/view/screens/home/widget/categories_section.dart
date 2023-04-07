import 'package:daif_customer/view/screens/home/widget/home_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key, required this.icons, required this.titles})
      : super(key: key);
  final List<String> icons;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(
          width: 12.w,
        ),
        ...titles
            .map((title) => HomeCategoryWidget(
                image: icons[titles.indexOf(title)], title: title))
            .toList(),
        SizedBox(
          width: 12.w,
        ),
      ]),
    );
  }
}
