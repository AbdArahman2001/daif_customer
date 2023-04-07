import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/view/screens/home/widget/best_hotel_widget.dart';
import 'package:daif_customer/view/screens/home/widget/famous_stadium_widget.dart';
import 'package:daif_customer/view/screens/home/widget/popluar_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'featured_chalet_or_apartment_widget.dart';

class FeaturedChaletsOrApartmentSection extends StatelessWidget {
  const FeaturedChaletsOrApartmentSection({Key? key, required this.featuredPlaces})
      : super(key: key);
  final List<PlaceModel> featuredPlaces;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(
          width: 12.w,
        ),
        ...featuredPlaces
            .map((place) => FeaturedChaletOrApartmentWidget(
          place: place,
        ))
            .toList(), SizedBox(
          width: 12.w,
        ),
      ]),
    );
  }
}

