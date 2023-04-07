import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/view/screens/home/widget/popluar_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularPlacesSection extends StatelessWidget {
  const PopularPlacesSection({Key? key, required this.popularPlaces})
      : super(key: key);
  final List<PlaceModel> popularPlaces;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(
          width: 12.w,
        ),
        ...popularPlaces
            .map((place) => PopularPlaceWidget(
                  place: place,
                ))
            .toList(),
        SizedBox(
          width: 12.w,
        ),
      ]),
    );
  }
}
