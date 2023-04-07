import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/view/basewidget/custom_app_bar.dart';
import 'package:daif_customer/view/screens/home/widget/best_hotels_section.dart';
import 'package:daif_customer/view/screens/home/widget/categories_section.dart';
import 'package:daif_customer/view/screens/home/widget/famous_stadiums_section.dart';
import 'package:daif_customer/view/screens/home/widget/featured_chalet_or_apartment_widget.dart';
import 'package:daif_customer/view/screens/home/widget/popular_places_section.dart';
import 'package:daif_customer/view/screens/home/widget/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/home_controller.dart';
import '../widget/featured_chalets_or_apartments_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    final List<String> titles = [
      locale.hotels,
      locale.apartments,
      locale.offices,
      locale.stadiums
    ];
    List<String> images = [
      "https://th.bing.com/th/id/OIP.-P9b_zM-QMuHimQW1VNgGwHaFL?pid=ImgDet&rs=1",
      "https://cdn1.vectorstock.com/i/1000x1000/93/00/a-special-offer-sale-icon-vector-27979300.jpg",
      "https://th.bing.com/th/id/OIP.KiRSyeSDDK_-o3GsHunAnwHaDg?pid=ImgDet&rs=1",
      "https://img.freepik.com/free-vector/special-offer-red-banner-sticker_275806-500.jpg?size=626&ext=jpg",
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: locale.home,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SliderWidget(
                  images: images,
                    aspectRatio: 2.5,
                    onTap: () {},
                    imageWidth: 290.w,
                    horizontalMargin: 0,
                    viewportFraction: 0.75,
                    enlargeCenterPage: true),
                SizedBox(
                  height: 20.h,
                ),
                CategoriesSection(
                    icons: controller.categoriesIcons, titles: titles),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    locale.popular_places,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                PopularPlacesSection(popularPlaces: controller.popularPlaces),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    locale.best_hotels,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                BestHotelsSection(bestHotels: controller.bestHotels),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    locale.famous_stadiums,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                FamousStadiumsSection(famousStadiums: controller.famousStadiums),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    locale.featured_chalets,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                FeaturedChaletsOrApartmentSection(featuredPlaces: controller.featuredChalets),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    locale.featured_apartments,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                FeaturedChaletsOrApartmentSection(featuredPlaces: controller.featuredApartments),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
