import 'package:daif_customer/controller/booking_controller.dart';
import 'package:daif_customer/helper/helper.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';
import 'package:daif_customer/utill/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingCalendarWidget extends StatefulWidget {
  const BookingCalendarWidget({Key? key}) : super(key: key);

  @override
  State<BookingCalendarWidget> createState() => _BookingCalendarWidgetState();
}

class _BookingCalendarWidgetState extends State<BookingCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return GetBuilder<BookingController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Theme
                  .of(context)
                  .dialogBackgroundColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      locale.select_days,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    Expanded(child: SizedBox()),
                    _MonthSelectorWidget(
                      controller: controller,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Divider(color: ColorManager.dividerColor),
                SizedBox(
                  height: 8.h,
                ),
                _MonthDaysGridWidget(
                    monthDaysCount: controller.selectedMonth.getDaysCount(controller.selectedYear),
                    bookedDays: controller.bookedDaysAtMonth,
                    selectedDays: controller.selectedDaysAtSelectedMonth,
                    month: controller.selectedMonth.index + 1,
                  selectFunc: controller.changeDayStatus,
                ),
              ],
            ),
          );
        });
  }
}

class _MonthDaysGridWidget extends StatelessWidget {
  const _MonthDaysGridWidget({Key? key,
    required this.monthDaysCount,
    required this.bookedDays,
    required this.month,
    required this.selectedDays, required this.selectFunc})
      : super(key: key);
  final int monthDaysCount;
  final List<String> bookedDays;
  final List<int> selectedDays;
  final int month;
  final void Function(String day) selectFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: monthDaysCount == 31 ? 410.h : 340.h,
      child: GridView.builder(
        // shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, childAspectRatio: 47 / 54),
          itemCount: monthDaysCount,
          itemBuilder: (context, index) {
            final bool isBooked = bookedDays.contains((index + 1).toString());
            final bool isSelected = selectedDays.contains((index + 1));
            return _SingleDayWidget(
                selectFunc:selectFunc,
                backgroundColor: isBooked
                    ? ColorManager.grey1
                    : isSelected
                    ? ColorManager.complementaryColor
                    : ColorManager.white1,
                textColor: isBooked
                    ? ColorManager.disabledBlackText
                    : isSelected
                    ? Colors.white
                    : ColorManager.blackTextColor,
                dayNumber: index + 1,
                dayName: Helper.getDayNameFromIndex(index, "saturday", month));
          }),
    );
  }
}

class _SingleDayWidget extends StatelessWidget {
  const _SingleDayWidget({Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.dayNumber,
    required this.dayName, required this.selectFunc})
      : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final int dayNumber;
  final String dayName;
  final void Function(String day) selectFunc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectFunc(dayNumber.toString()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dayNumber.toString(),
              style: style_600_15(textColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              dayName,
              style: style_400_8(textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _MonthSelectorWidget extends StatelessWidget {
  const _MonthSelectorWidget({required this.controller});

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme
              .of(context)
              .accentColor),
      child: DropdownButton<Month>(
          value: controller.selectedMonth,
          underline: SizedBox.shrink(),
          iconEnabledColor: Colors.white,
          dropdownColor: Theme
              .of(context)
              .accentColor,
          icon: const Icon(Icons.expand_more),
          items: Month.values
              .map((month) =>
              DropdownMenuItem<Month>(
                  alignment: Alignment.center,
                  value: month,
                  child: Text(
                    month.month2Name(context),
                    style: style_500_12(Colors.white),
                  )))
              .toList(),
          onChanged: controller.selectCalendarMonth),
    );
  }
}

enum Month { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }

extension MonthExt on Month {
  String month2Name(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    switch (this) {
      case Month.jan:
        return locale.january;
      case Month.feb:
        return locale.february;

      case Month.mar:
        return locale.march;

      case Month.apr:
        return locale.april;

      case Month.may:
        return locale.may;

      case Month.jun:
        return locale.jun;

      case Month.jul:
        return locale.july;

      case Month.aug:
        return locale.august;

      case Month.sep:
        return locale.september;

      case Month.oct:
        return locale.october;

      case Month.nov:
        return locale.november;

      case Month.dec:
        return locale.december;
    }
  }

  int getDaysCount(int year) {
    switch (this) {
      case Month.jan:
        return 31;
      case Month.feb:
        final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
        return isLeapYear ? 29 : 28;
      case Month.mar:
        return 31;

      case Month.apr:
        return 30;

      case Month.may:
        return 31;

      case Month.jun:
        return 30;

      case Month.jul:
        return 31;

      case Month.aug:
        return 31;

      case Month.sep:
        return 30;

      case Month.oct:
        return 31;

      case Month.nov:
        return 30;

      case Month.dec:
        return 31;
    }
  }
}
