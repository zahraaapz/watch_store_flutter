import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../widget/btmNav.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(children: [

        Positioned(
          top: 0,
          bottom: size.height*.1,
          left: 0,
          right: 0,
          child: Container(
color: Colors.red,

        )) ,
      BtmNavItem(onTap: (){}, iconPath: Assets.svg.user, isActive: false, text:"پروفایل",),
      BtmNavItem(onTap: (){}, iconPath: Assets.svg.basket, isActive: false, text: "سبد خرید",),
      BtmNavItem(onTap: (){}, iconPath: Assets.svg.home, isActive: true, text: 'خانه',),
      ],),
    );
  }
}

