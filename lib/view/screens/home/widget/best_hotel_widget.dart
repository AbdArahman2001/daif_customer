import 'package:cached_network_image/cached_network_image.dart';
import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/utill/styles_manager.dart';
import 'package:daif_customer/view/basewidget/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utill/assets_manager.dart';
import '../../../../utill/color_manager.dart';

class BestHotelWidget extends StatelessWidget {
  const BestHotelWidget({Key? key, required this.hotel}) : super(key: key);
  final PlaceModel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 97.h,
      width: 250.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          Stack(
            // alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CustomCachedNetworkImage(
                  imageUrl: hotel.image,
                  height: 90.h,
                  width: 90.w,
                ),
              ),
              Positioned(
                top: -5,
                right: -4,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      hotel.isFavorite != null && hotel.isFavorite!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: hotel.isFavorite != null && hotel.isFavorite!
                          ? ColorManager.errorColor
                          : null,
                    )),
              )
            ],
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hotel.name,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      hotel.address,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "2 persons",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.light,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "\$${hotel.nightPrice!}",
                      style: style_500_12(Theme.of(context).primaryColor),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 16.w,
                      ),
                    ),
                    Icon(
                      Icons.sunny,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "\$${hotel.dayPrice!}",
                      style: style_500_12(Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
