import 'package:daif_customer/controller/categories_controller.dart';
import 'package:daif_customer/data/model/response/stadium_model.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/view/basewidget/custom_app_bar.dart';
import 'package:daif_customer/view/screens/categories/widget/stadium_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StadiumsScreen extends StatelessWidget {
  const StadiumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: locale.stadiums,
      ),
      body: GetBuilder<CategoriesController>(
        init: CategoriesController(),
        builder: (controller) {
          final List<StadiumModel> stadiums = controller.stadiums;
          return GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 164.w / 230.h,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 10.w,
                  crossAxisCount: 2),
              itemCount: controller.stadiums.length ,
              itemBuilder: (context, index) {
                return StadiumWidget(stadiumModel: stadiums[index]);
              });
        },
      ),
    );
  }
}
