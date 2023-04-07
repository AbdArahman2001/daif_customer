import 'package:carousel_slider/carousel_slider.dart';
import 'package:daif_customer/utill/assets_manager.dart';
import 'package:daif_customer/view/screens/home/widget/single_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utill/color_manager.dart';
import '../../../basewidget/indicator_circle_widget.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget(
      {Key? key,
      required this.aspectRatio,
      required this.onTap,
      required this.imageWidth,
      required this.horizontalMargin,
      required this.viewportFraction,
      required this.enlargeCenterPage, required this.images,})
      : super(key: key);
  final double aspectRatio;
  final VoidCallback onTap;
  final double imageWidth;
  final double horizontalMargin;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final List<String> images;
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;

   final indicatorWidth = 100;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.images
              .map((image) => SingleSliderWidget(
                    imagePath: image,
                    onTap: widget.onTap,
                    imageWidth: widget.imageWidth,
                    horizontalMargin: widget.horizontalMargin,
                  ))
              .toList(),
          options: CarouselOptions(
              aspectRatio: widget.aspectRatio,
              viewportFraction: widget.viewportFraction,
              autoPlay: true,
              padEnds: true,
              enlargeCenterPage: widget.enlargeCenterPage,
              onPageChanged: (index, _) {
                currentIndex = index;
                setState(() {});
              }),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h),
              width: indicatorWidth.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            Positioned(
              left: currentIndex *(indicatorWidth.w/widget.images.length),
              child: Container(
                margin: EdgeInsets.only(top: 10.h),
                width: indicatorWidth.w/widget.images.length,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
