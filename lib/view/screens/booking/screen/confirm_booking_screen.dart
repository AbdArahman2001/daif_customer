import 'package:daif_customer/data/model/response/booking_time_model.dart';
import 'package:daif_customer/view/screens/booking/widget/booking_time_widget.dart';
import 'package:flutter/material.dart';

import '../../../../controller/booking_controller.dart';

class ConfirmBookingScreen extends StatelessWidget {
  const ConfirmBookingScreen({Key? key, required this.controller})
      : super(key: key);
  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookingTimeWidget(
            selectedBookings: controller.allSelectedDays
                .map((strInfo) => BookingTimeModel.fromStringInfo(strInfo))
                .toList(),
            deleteBookingTimeFunc: controller.deleteBookingTime)
      ],
    );
  }
}
