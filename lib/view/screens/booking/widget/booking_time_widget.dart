import 'package:daif_customer/data/model/response/booking_time_model.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';
import 'package:daif_customer/utill/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTimeWidget extends StatelessWidget {
  const BookingTimeWidget(
      {Key? key,
      required this.selectedBookings,
      required this.deleteBookingTimeFunc})
      : super(key: key);
  final List<BookingTimeModel> selectedBookings;
  final void Function(String) deleteBookingTimeFunc;

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).dialogBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            locale.booking_time,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 20.h,),
          Visibility(
              visible: selectedBookings.isEmpty, child: Text(locale.no_bookings_yet)),
          ...selectedBookings
              .map((model) => _SingleBookingTimeWidget(
                    deleteBookingTimeFunc: deleteBookingTimeFunc,
                    model: model,
                    period: model.period == "a" ? locale.am : locale.pm,
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class _SingleBookingTimeWidget extends StatelessWidget {
  const _SingleBookingTimeWidget(
      {Key? key,
      required this.model,
      required this.period,
      required this.deleteBookingTimeFunc})
      : super(key: key);
  final BookingTimeModel model;
  final String period;
  final void Function(String) deleteBookingTimeFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.watch,
          color: ColorManager.blackTextColor,
        ),
        Text(
          model.toFormattedTime() + period,
          style: style_400_14(ColorManager.blackTextColor),
        ),
        IconButton(
            onPressed: () => deleteBookingTimeFunc(model.toStringInfo()),
            icon: const Icon(
              Icons.cancel,
              color: ColorManager.errorColor,
            )),
      ],
    );
  }
}
