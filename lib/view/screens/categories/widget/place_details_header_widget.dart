import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/data/model/response/stadium_model.dart';
import 'package:daif_customer/view/screens/categories/widget/place_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utill/color_manager.dart';

class PlaceDetailsHeaderWidget extends StatelessWidget {
  const PlaceDetailsHeaderWidget({Key? key, required this.place})
      : super(key: key);
  final StadiumModel place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 395.h,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 360.h,
            // width: 360.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: PlaceImagesWidget(
                images: [
                  place.image,
                  place.image,
                  place.image,
                  place.image,
                  place.image,
                  place.image,
                ],
                aspectRatio: 1.1,
                onTap: () {},
                imageWidth: 360.w,
                imageHeight: 360.h,
                horizontalMargin: 0,
                viewportFraction: 1,
                enlargeCenterPage: false),
          ),
          Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Expanded(child: SizedBox()),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                    SizedBox(
                      width: 20.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          place.isFavorite != null && place.isFavorite!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: place.isFavorite != null && place.isFavorite!
                              ? ColorManager.errorColor
                              : null,
                        )),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: 326.w,
                height: 70.w,
                // padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 14.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Theme.of(context).dialogBackgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              place.address,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "\$120",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "/Night",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "\$120",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "/Evening",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
