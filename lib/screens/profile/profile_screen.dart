import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';
import '../../gen/assets.gen.dart';
import '../../widget/cart_screen.dart';
import '../../widget/surface_container.dart';



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
                  const Text(
                    'ساسان صفری',
                    style: MyStyles.avatarText,
                  ),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        MyStrings.activeAddress,
                        style: MyStyles.title,
                      )),
                  const Align(
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
                  SizedBox(height: 50,child: SurfaceContainer(child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: const Text('قوانین',style: MyStyles.avatarText,textAlign: TextAlign.end,),
                  )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


