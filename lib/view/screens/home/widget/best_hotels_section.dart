import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/view/screens/home/widget/best_hotel_widget.dart';
import 'package:daif_customer/view/screens/home/widget/popluar_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestHotelsSection extends StatelessWidget {
  const BestHotelsSection({Key? key, required this.bestHotels})
      : super(key: key);
  final List<PlaceModel> bestHotels;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(
          width: 12.w,
        ),
        ...bestHotels
            .map((hotel) => BestHotelWidget(
                  hotel: hotel,
                ))
            .toList(), SizedBox(
          width: 12.w,
        ),
      ]),
    );
  }
}
