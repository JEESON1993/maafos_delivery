// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/view/app/Home/dashboard_screen.dart';
import 'package:maafosdelivery/view/app/Order/order_screen.dart';
import 'package:maafosdelivery/view/app/Earnings/earnings_screen.dart';
import 'package:maafosdelivery/view/app/Settlement/settlement_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: IndexedStack(
          children: [
            DashboardPage(),
            OrderPage(),
            EarningsPage(),
            SettlementPage()
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          unselectedItemColor: kGreyLight,
          selectedItemColor: kPrimaryColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/svg/home.svg',
                height: 20,
                color: kPrimaryColor,
              ),
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                height: 20,
                color: kGreyLight,
              ),
              // ignore: deprecated_member_use
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Dashboard',
                  style: kNavBarTitle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/svg/order.svg',
                height: 20,
                color: kPrimaryColor,
              ),
              icon: SvgPicture.asset(
                'assets/svg/order.svg',
                height: 20,
                color: kGreyLight,
              ),
              // ignore: deprecated_member_use
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Orders',
                  style: kNavBarTitle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/svg/product.svg',
                height: 20,
                color: kPrimaryColor,
              ),
              icon: SvgPicture.asset(
                'assets/svg/product.svg',
                height: 20,
                color: kGreyLight,
              ),
              // ignore: deprecated_member_use
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Earnings',
                  style: kNavBarTitle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/svg/settlement.svg',
                height: 20,
                color: kPrimaryColor,
              ),
              icon: SvgPicture.asset(
                'assets/svg/settlement.svg',
                height: 20,
                color: kGreyLight,
              ),
              // ignore: deprecated_member_use
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Settlement',
                  style: kNavBarTitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
