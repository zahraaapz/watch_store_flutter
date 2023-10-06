import 'package:flutter/material.dart';
import 'package:watch_store_flutter/screens/mainscreen/bascket_screen.dart';
import 'package:watch_store_flutter/screens/mainscreen/home_screen.dart';

import '../../gen/assets.gen.dart';
import '../../widget/btmNav.dart';
import 'profile_screen.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();

  static const profile = 2;
  static const home = 0;
  static const basket = 1;
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: size.height * .1,
                left: 0,
                right: 0,
                child: IndexedStack(
                  index: selectedIndex, children: [
                  HomeScreen(),
                  BasketScreen(),
                  ProfileScreen(),
                ])),
            Positioned(
             bottom:0,
                left: 0,
                right: 0,
              child: Container(
                color:Colors.white,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtmNavItem(
                      size: size,
                      onTap: () => btmNavOnPressed(index: BtmNavScreenIndex.profile),
                      iconPath: Assets.svg.user,
                      isActive: selectedIndex==BtmNavScreenIndex.profile,
                      text: "پروفایل",
                    ),
                    BtmNavItem(
                      onTap: () => btmNavOnPressed(index: BtmNavScreenIndex.basket),
                      iconPath: Assets.svg.basket,
                      isActive: selectedIndex==BtmNavScreenIndex.basket,
                      text: "سبد خرید",
                    size: size,),
                    BtmNavItem(
                      onTap: () => btmNavOnPressed(index: BtmNavScreenIndex.home),
                      iconPath: Assets.svg.home,
                      isActive: selectedIndex==BtmNavScreenIndex.home,
                      text: 'خانه',
                       size: size ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 btmNavOnPressed({required int index}) {
    setState(() {
      selectedIndex = index;
    });
  }
}
