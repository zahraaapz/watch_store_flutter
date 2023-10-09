import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/color.dart';
import '../res/dimens.dart';
import '../res/string.dart';

class searchBtn extends StatelessWidget {
  const searchBtn({
    super.key,
    required this.onTap
  });
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MyDimens.medium),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52,
          width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
                boxShadow: const [
                  BoxShadow(
                  blurRadius: 4,
                  color: MyColors.shadow,
                offset: Offset(0,3))
                ]
              ),
                  child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        SvgPicture.asset(Assets.svg.search),
        const Text(MyStrings.searchProduct,style: MyStyles.hint,),
        Padding(
          padding: const EdgeInsets.all(MyDimens.small),
          child: Image.asset(Assets.png.mainLogo.path),
        )
                  ]),  ),
      ),
    );
  }
}