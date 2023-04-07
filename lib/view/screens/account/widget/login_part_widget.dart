import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';
import 'package:daif_customer/utill/styles_manager.dart';
import 'package:daif_customer/view/basewidget/button/custom_elevated_button.dart';
import 'package:daif_customer/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPartWidget extends StatelessWidget {
  const LoginPartWidget(
      {Key? key, required this.isRememberMe, required this.changeRememberMe, required this.changeLoginMethod})
      : super(key: key);
  final bool isRememberMe;
  final ValueChanged<bool?> changeRememberMe;
  final VoidCallback changeLoginMethod;

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isRememberMe,
          onChanged: changeRememberMe,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
        ),
        Text(
          locale.remember_me,
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall,
        ),
        const Expanded(child: SizedBox()),
        TextButton(
            onPressed: () {},
            child: Text(
              locale.forget_password,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: ColorManager.greyTextButton),
            )),

          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomElevatedButton(onPressed: () {
          Get.to(const DashboardScreen());
        }, child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locale.start_booking),
            SizedBox(width: 40.w,),
            Icon(Icons.arrow_forward),
          ],
        ),),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(locale.i_do_not_have_account, style: Theme
                .of(context)
                .textTheme
                .headlineMedium,),
            TextButton(
                onPressed: changeLoginMethod, child: Text(locale.sign_up,))
          ],
        )
      ],
    );
  }
}
