import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/assets_manager.dart';
import 'package:daif_customer/utill/styles_manager.dart';
import 'package:daif_customer/utill/values_manager.dart';
import 'package:daif_customer/view/screens/onboarding/screen/single_on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utill/color_manager.dart';
import '../../../basewidget/button/custom_back_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    final titles = [
      locale.first_on_boarding_title,
      locale.second_on_boarding_description,
      locale.third_on_boarding_description,
      locale.fourth_on_boarding_title,
    ];
    final descriptions = [
      locale.first_on_boarding_description,
      locale.second_on_boarding_description,
      locale.third_on_boarding_description,
      locale.fourth_on_boarding_description,
    ];
    final images = [
      ImageAssets.onBoardingImg1,
      ImageAssets.onBoardingImg2,
      ImageAssets.onBoardingImg3,
      ImageAssets.onBoardingImg4,
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20.h,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.backgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: ColorManager.backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     CustomBackButton(onPressed:goPreviousPage ,),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(locale.skip),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: ColorManager.grey1,
                          fixedSize: Size(90.w, 37.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.r))),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: goNextPage,
                  children: images
                      .map((image) => SingleOnBoardingView(
                          title: titles[images.indexOf(image)],
                          description: descriptions[images.indexOf(image)],
                          imgUrl: image))
                      .toList(),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 45.h),
            child: ElevatedButton(
              onPressed: () => pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut),
              style: ElevatedButton.styleFrom(fixedSize: Size(220.w, 60.h)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(child: SizedBox()),
                  Text(
                    index == titles.length - 1 ? locale.login : locale.next,
                    style: style_500_16(ColorManager.whiteColor),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  SizedBox(
                    width: 42.w,
                    height: 42.w,
                    child: OutlinedButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: ColorManager.primaryGradient,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(ValuesManager.border),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  goNextPage(int index) {
    this.index = index;
    setState(() {});
  }
  goPreviousPage(){
    pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
