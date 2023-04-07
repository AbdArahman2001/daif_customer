import 'package:daif_customer/view/screens/categories/screen/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/model/response/stadium_model.dart';
import '../../../../utill/color_manager.dart';
import '../../../basewidget/custom_cached_network_image.dart';
class StadiumWidget extends StatelessWidget {
  const StadiumWidget({Key? key,required this.stadiumModel}) : super(key: key);
final StadiumModel stadiumModel;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: ()=>Get.to(PlaceDetailsScreen(place: stadiumModel)),
      child: Container(
        // width: 212.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        // margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Hero(
                tag: stadiumModel.image,
                child: CustomCachedNetworkImage(
                  imageUrl: stadiumModel.image,
                  height: 150.h,
                  // width: 150.w,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    stadiumModel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                // SizedBox(width: 100.w,),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                       stadiumModel.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:stadiumModel.isFavorite
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
                  stadiumModel.address,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  stadiumModel.ground,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
