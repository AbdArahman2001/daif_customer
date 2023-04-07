import 'package:daif_customer/view/dashboard_screen.dart';
import 'package:daif_customer/view/screens/account/screen/terms_and_conditions_screen.dart';
import 'package:daif_customer/view/screens/booking/screen/booking_screen.dart';
import 'package:daif_customer/view/screens/onboarding/screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:daif_customer/utill/theme_manager.dart';
import 'di_container.dart' as di;
import 'helper/custom_delegate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        // TODO check your device size
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          themeMode: ThemeMode.dark,
              theme: getLightTheme(),
              debugShowCheckedModeBanner: false,
              locale: L10n.all.first,
              supportedLocales: L10n.all,
              localizationsDelegates:  const [
                 AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              home:  const DashboardScreen(),
            ));
  }
}
