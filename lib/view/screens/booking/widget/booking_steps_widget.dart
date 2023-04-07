import 'package:daif_customer/utill/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingStepsWidget extends StatelessWidget {
  const BookingStepsWidget({Key? key, required this.isFirstStep})
      : super(key: key);
  final bool isFirstStep;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 1.h,
            width: 58.w,
            color: Theme.of(context).primaryColor,
          ),
          CircleAvatar(
            radius: 18.r,
            backgroundColor:
           Theme.of(context).primaryColor ,
            child:  const Icon(
              Icons.calendar_month,
              color:  Colors.white,
            ),
          ),
          Container(
            height: 1.h,
            width: 130.w,
            color: isFirstStep?ColorManager.grey2:Theme.of(context).primaryColor,
          ),
          CircleAvatar(
            radius: 18.r,
            backgroundColor:
            !isFirstStep ? Theme.of(context).primaryColor : ColorManager.grey2,
            child:  const Icon(
              Icons.description,
              color: Colors.white ,
            ),
          ),
          Container(
            height: 1.h,
            width: 58.w,
            color: isFirstStep?ColorManager.grey2:Theme.of(context).primaryColor,
          ),          ],
      ),
    );
  }
}

class _StepIconWidget extends StatelessWidget {
  const _StepIconWidget({Key? key, required this.isFirstStep, required this.icon})
      : super(key: key);
  final bool isFirstStep;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
      backgroundColor:
          isFirstStep ? Theme.of(context).primaryColor : ColorManager.grey2,
      child:  Icon(
        icon,
        color: isFirstStep ? Colors.white : ColorManager.grey2,
      ),
    );
  }
}

