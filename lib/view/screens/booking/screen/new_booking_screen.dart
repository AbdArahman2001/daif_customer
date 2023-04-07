import 'package:daif_customer/controller/booking_controller.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';
import 'package:daif_customer/view/basewidget/button/custom_elevated_button.dart';
import 'package:daif_customer/view/basewidget/custom_app_bar.dart';
import 'package:daif_customer/view/screens/booking/widget/booking_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/booking_period_widget.dart';

class NewBookingScreen extends StatelessWidget {
  const NewBookingScreen({Key? key, required this.controller}) : super(key: key);
final BookingController controller;
  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Column(
      children: [
        BookingPeriodWidget(selectedPeriod: controller.selectedPeriod, changeSelectedPeriod: controller.changeSelectedPeriod),
        SizedBox(
          height: 20.h,
        ),
        const BookingCalendarWidget(),
        SizedBox(height: 20.h,),
        CustomElevatedButton(onPressed:()=> controller.changeBookingStepIndex(1), child: Text(locale.next)),
        SizedBox(height: 20.h,),
      ],
    );

  }
}
