import 'package:cached_network_image/cached_network_image.dart';
import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/utill/assets_manager.dart';
import 'package:daif_customer/utill/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../basewidget/custom_cached_network_image.dart';

class PopularPlaceWidget extends StatelessWidget {
  const PopularPlaceWidget({Key? key, required this.place}) : super(key: key);
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 212.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CustomCachedNetworkImage(
              imageUrl: place.image,
              height: 196.h,
              width: 196.w,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  place.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              // SizedBox(width: 100.w,),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    place.isFavorite != null && place.isFavorite!
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: place.isFavorite != null && place.isFavorite!
                        ? ColorManager.errorColor
                        : null,
                  ))
            ],
          ),
          SizedBox(
            height: 8.h,
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
                place.address,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
