import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daif_customer/localization/my_localizations.dart';
import 'package:daif_customer/utill/color_manager.dart';

import '../helper/network_info.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;
  late List<IconData> _tabBarIcons;

  @override
  void initState() {
    super.initState();
    _screens = [
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold()
    ];
    _tabBarIcons = [
      Icons.dashboard_outlined,
      Icons.list,
      Icons.add,
      Icons.description_outlined,
      Icons.settings
    ];
    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    final locale = MyLocalizations.translate(context);
    final itemsTitles = [
      locale.dashboard,
      locale.orders,
      "",
      locale.collections,
      locale.settings
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: itemsTitles.map((e) {
            int index = itemsTitles.indexOf(e);
            return BottomNavigationBarItem(
                icon: index == 2
                    ? CircleAvatar(
                        radius: 18.r,
                        backgroundColor: ColorManager.grey8,
                        child: Icon(
                          _tabBarIcons[index],
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    : Icon(_tabBarIcons[index]),
                label: e);
          }).toList(),
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
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
