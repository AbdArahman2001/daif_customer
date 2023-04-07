import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/view/basewidget/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamousStadiumWidget extends StatelessWidget {
  const FamousStadiumWidget({Key? key, required this.stadium})
      : super(key: key);
  final PlaceModel stadium;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: CustomCachedNetworkImage(
                imageUrl: stadium.image,
                height: 80.h,
                width: 110.w,
              )),
          Text(
            stadium.name,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
