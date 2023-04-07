import 'package:daif_customer/view/screens/categories/screen/categories_screen.dart';
import 'package:daif_customer/view/screens/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';

import '../helper/network_info.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;
  late List<IconData> _tabBarIcons;

  @override
  void initState() {
    super.initState();
    _screens = [HomeScreen(), CategoriesScreen(), Scaffold(), Scaffold()];
    _tabBarIcons = [
      Icons.home,
      Icons.grid_view,
      Icons.calendar_month,
      Icons.person_outlined,
    ];
    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    final itemsTitles = [
      locale.home,
      locale.places,
      locale.my_bookings,
      locale.profile
    ];
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32.r),topRight: Radius.circular(32.r)),
          child: BottomNavigationBar(
            currentIndex: _pageIndex,
            type: BottomNavigationBarType.fixed,
            items: itemsTitles.map((e) {
              int index = itemsTitles.indexOf(e);
              return BottomNavigationBarItem(
                  icon: Icon(_tabBarIcons[index]), label: e);
            }).toList(),
            onTap: (int index) {
              _setPage(index);
            },
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
