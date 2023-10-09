import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';

import '../components/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/dimens.dart';
import '../res/string.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key,
    required this.size,
    required this.title,
    required this.iconPath,
    required this.colors,
    required this.ontap,
  });

  final Size size;
  final String title;
  final  Function()  ontap;
  final  String  iconPath;
  final List<Color> colors;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Container(
            margin: const EdgeInsets.all(MyDimens.small),
            height:size.height*.1,
            width:size.height*.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: colors
              ),borderRadius: BorderRadius.circular(MyDimens.large),
           image: DecorationImage(image:Image.asset(Assets.svg.close).image,),
          )),
              MyDimens.small.height ,
              Text(MyStrings.classic,style: MyStyles.title.copyWith(fontSize: 18),) ],);
  }
}