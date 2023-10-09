import 'package:flutter/material.dart';

import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/widget/cat_widget.dart';

import '../../widget/app_slider.dart';
import '../../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Scaffold(
          body: Column(
            children: [
              searchBtn(
                onTap: () {},
              ),
              AppSlider(),
              Row(
                children: [
                  CatWidget(
                      size: size,
                      title: MyStrings.desktop,
                      iconPath: Assets.svg.desktop,
                      colors: MyColors.catDesktop,
                      ontap: () {}),
                  CatWidget(
                      size: size,
                      title: MyStrings.digital,
                      iconPath: Assets.svg.digital,
                      colors: MyColors.catDigital,
                      ontap: () {}),
                  CatWidget(
                      size: size,
                      title: MyStrings.smart,
                      iconPath: Assets.svg.smart,
                      colors: MyColors.catSmart,
                      ontap: () {}),
                  CatWidget(
                      size: size,
                      title: MyStrings.classic,
                      iconPath: Assets.svg.clasic,
                      colors: MyColors.catClassic,
                      ontap: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
