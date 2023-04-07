import 'package:daif_customer/view/basewidget/custom_app_bar.dart';
import 'package:daif_customer/view/screens/categories/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/categories_controller.dart';
import '../../../../localization/my_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
     final List<String> categoriesName = [
       locale.apartments,
       locale.hotels,
       locale.stadiums,
       locale.chalets,
       locale.offices,
     ];
    return Scaffold(
      appBar: CustomAppBar(title: locale.places),
      body: GetBuilder<CategoriesController>(
        init: CategoriesController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                ...controller.categoriesImages
                    .map((image) => CategoryWidget(
                        imageUrl: image, title: categoriesName[controller.categoriesImages.indexOf(image)]))
                    .toList(),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
