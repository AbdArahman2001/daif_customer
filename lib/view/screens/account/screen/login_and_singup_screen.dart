import 'package:daif_customer/controller/auth_controller.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/assets_manager.dart';
import 'package:daif_customer/view/basewidget/empty_app_bar.dart';
import 'package:daif_customer/view/screens/account/widget/auth_method_tab_button.dart';
import 'package:daif_customer/view/screens/account/widget/login_part_widget.dart';
import 'package:daif_customer/view/screens/account/widget/signup_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utill/color_manager.dart';
import '../../../../utill/styles_manager.dart';

class LoginAndSingUpScreen extends StatefulWidget {
  const LoginAndSingUpScreen({Key? key}) : super(key: key);

  @override
  _LoginAndSingUpScreenState createState() => _LoginAndSingUpScreenState();
}

class _LoginAndSingUpScreenState extends State<LoginAndSingUpScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    ImageAssets.onBoardingImg1,
                    fit: BoxFit.cover,
                    width: 60.w,
                    height: 60.w,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => authController
                            .changeLoginMethod(LoginMethod.register),
                        child: AuthMethodTabButton(
                            title: locale.sign_up_tap_button,
                            isSelected: authController.loginMethod ==
                                LoginMethod.register),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      InkWell(
                        onTap: () =>
                            authController.changeLoginMethod(LoginMethod.login),
                        child: AuthMethodTabButton(
                            title: locale.login,
                            isSelected: authController.loginMethod ==
                                LoginMethod.login),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: locale.phone_number,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: locale.password,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  authController.loginMethod == LoginMethod.login
                      ? LoginPartWidget(
                          isRememberMe: authController.rememberMe,
                          changeRememberMe: authController.changeRememberMe,
                          changeLoginMethod:()=> authController
                              .changeLoginMethod(LoginMethod.login),
                        )
                      : SignUpPartWidget(
                          isTermsAndConditions:
                              authController.isTermsAndConditions,
                          changeTermsAndConditions:
                              authController.changeTermsAndConditions,
                          changeLoginMethod: ()=>authController
                              .changeLoginMethod(LoginMethod.register),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
