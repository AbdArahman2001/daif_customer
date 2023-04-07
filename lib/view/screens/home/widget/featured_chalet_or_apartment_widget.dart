import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/view/basewidget/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utill/color_manager.dart';

class FeaturedChaletOrApartmentWidget extends StatelessWidget {
  const FeaturedChaletOrApartmentWidget({Key? key, required this.place})
      : super(key: key);
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Theme.of(context).dialogBackgroundColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CustomCachedNetworkImage(imageUrl: place.image,width: double.infinity,height: 150.h,),
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
