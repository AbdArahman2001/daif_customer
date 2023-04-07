import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/view/screens/home/widget/best_hotel_widget.dart';
import 'package:daif_customer/view/screens/home/widget/famous_stadium_widget.dart';
import 'package:daif_customer/view/screens/home/widget/popluar_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamousStadiumsSection extends StatelessWidget {
  const FamousStadiumsSection({Key? key, required this.famousStadiums})
      : super(key: key);
  final List<PlaceModel> famousStadiums;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(
          width: 12.w,
        ),
        ...famousStadiums
            .map((stadium) => FamousStadiumWidget(
          stadium: stadium,
        ))
            .toList(), SizedBox(
          width: 12.w,
        ),
      ]),
    );
  }
}

