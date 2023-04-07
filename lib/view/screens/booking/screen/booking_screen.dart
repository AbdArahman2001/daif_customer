import 'package:daif_customer/controller/booking_controller.dart';
import 'package:daif_customer/di_container.dart';
import 'package:daif_customer/view/screens/booking/screen/new_booking_screen.dart';
import 'package:daif_customer/view/screens/booking/widget/booking_period_widget.dart';
import 'package:daif_customer/view/screens/booking/widget/booking_steps_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../localization/my_localizations.dart';
import '../../../basewidget/custom_app_bar.dart';
import 'confirm_booking_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return GetBuilder<BookingController>(
        init: BookingController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.bookingStepIndex == 0) {
                return true;
              }
              controller.changeBookingStepIndex(0);
              return false;
            },
            child: Scaffold(
              appBar: CustomAppBar(
                title: controller.bookingStepIndex == 0
                    ? locale.new_booking
                    : locale.confirm_booking,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => controller.bookingStepIndex == 0
                      ? Get.back()
                      : controller.changeBookingStepIndex(0),
                ),
                actions: const SizedBox.shrink(),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      BookingStepsWidget(
                          isFirstStep: controller.bookingStepIndex == 0),
                      SizedBox(
                        height: 20.h,
                      ),
                      controller.bookingStepIndex == 0
                          ? NewBookingScreen(
                              controller: controller,
                            )
                          : ConfirmBookingScreen(
                              controller: controller,
                            )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
