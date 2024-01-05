import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';

import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/widget/cat_widget.dart';

import '../../widget/app_slider.dart';
import '../../widget/product_item.dart';
import '../../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        searchBtn(
          onTap: () {},
        ),
        AppSlider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
        MyDimens.large.height,
        Row(
          children: [
            SizedBox(
              height: 197,
              width:310 ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  shrinkWrap: true,
                 // physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) =>
                   productItem(price: 50000, productName: 'ساعت مردانه',)),
            ),
            VerticalText()
          ],
        )
      ],
    );
  }
}

class VerticalText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                
                Transform.rotate(
                  angle: 1.5,
                  child: SvgPicture.asset(Assets.svg.back)), 
                  Text('مشاهده همه')],
            ),
                  Text('شگفت انگیز',style: MyStyles.amazingStyle,)
          ],
        ),
      ),
    );
  }
}
