import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';
import 'package:daif_customer/utill/styles_manager.dart';
import 'package:daif_customer/view/basewidget/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPartWidget extends StatelessWidget {
  const SignUpPartWidget(
      {Key? key, required this.isTermsAndConditions, required this.changeTermsAndConditions, required this.changeLoginMethod})
      : super(key: key);
  final bool isTermsAndConditions;
  final ValueChanged<bool?> changeTermsAndConditions;
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
              value: isTermsAndConditions,
              onChanged: changeTermsAndConditions,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
            ),
            Text(
              locale.terms_and_conditions,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomElevatedButton(onPressed: () {}, child: Text(locale.sign_up),),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(locale.i_have_account, style: Theme
                .of(context)
                .textTheme
                .headlineMedium,),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: changeLoginMethod, child: Text(locale.login,))
          ],
        )
      ],
    );
  }
}
