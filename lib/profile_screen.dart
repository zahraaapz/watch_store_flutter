import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/screens/mainscreen/cart_screen.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';

import 'gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            MyStrings.profile,
            style: MyStyles.title,
          ),
        )),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: MyDimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyDimens.medium.height,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(Assets.png.avatar.path),
                  ),
                  MyDimens.medium.height,
                  Text(
                    'ساسان صفری',
                    style: MyStyles.avatarText,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        MyStrings.activeAddress,
                        style: MyStyles.title,
                      )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            MyStrings.lurem,
                            style: MyStyles.title,
                            softWrap: true,
                            maxLines: 2,
                          ))
                        ],
                      )),
                  MyDimens.small.height,
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: MyColors.surfaceColor,
                  ),
                  MyDimens.small.height,
                  ProfileItem(
                    svgIcon: Assets.svg.user,
                    title: 'ساسان صفری',
                  ),
                  ProfileItem(svgIcon: Assets.svg.cart, title: '5749'),
                  ProfileItem(
                    svgIcon: Assets.svg.phone,
                    title: '031997845',
                  ),
                  SurfaceContainer(child: Text('قوانین'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.svgIcon});
  final svgIcon;
  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MyDimens.small),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: MyStyles.title,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.right,
            )),
            MyDimens.small.width,
            SvgPicture.asset(svgIcon)
          ],
        ),
      ),
    );
  }
}
