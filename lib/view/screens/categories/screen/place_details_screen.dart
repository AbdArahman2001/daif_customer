import 'package:daif_customer/controller/categories_controller.dart';
import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/data/model/response/stadium_model.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/view/basewidget/button/custom_elevated_button.dart';
import 'package:daif_customer/view/basewidget/empty_app_bar.dart';
import 'package:daif_customer/view/screens/booking/screen/booking_screen.dart';
import 'package:daif_customer/view/screens/booking/screen/new_booking_screen.dart';
import 'package:daif_customer/view/screens/categories/widget/place_details_header_widget.dart';
import 'package:daif_customer/view/screens/categories/widget/place_services_widget.dart';
import 'package:daif_customer/view/screens/home/widget/slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utill/color_manager.dart';
import '../widget/place_images_widget.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({Key? key, required this.place}) : super(key: key);
  final StadiumModel place;

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Scaffold(
      appBar: const EmptyAppBar(
        height: 0,
      ),
      body: GetBuilder<CategoriesController>(
        builder: (controller) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  PlaceDetailsHeaderWidget(place: place),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          _DetailsWidget(
                              place: place, dummyDetails: controller.dummyDetails),
                          SizedBox(
                            height: 20.h,
                          ),
                          ServicesWidget(services: controller.placeServices),
                          SizedBox(
                            height: 100.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 18.w),
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).dialogBackgroundColor,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25.r), right: Radius.circular(25.r)),
                ),
                child: CustomElevatedButton(
                    onPressed: () =>Get.to(BookingScreen()),
                    child: Text(
                      locale.book_now,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}

class _DetailsWidget extends StatelessWidget {
  const _DetailsWidget(
      {Key? key, required this.place, required this.dummyDetails})
      : super(key: key);
  final StadiumModel place;
  final String dummyDetails;

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(locale.details,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).primaryColor)),
        SizedBox(
          height: 12.h,
        ),
        Divider(
          color: ColorManager.dividerColor,
          indent: 20.w,
          endIndent: 20.w,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          dummyDetails,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "2 ${locale.person}",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.blackTextColor),
            )
          ],
        ),
      ]),
    );
  }
}
