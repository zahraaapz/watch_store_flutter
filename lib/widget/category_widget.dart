import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:watch_store_flutter/components/extention.dart';

import '../components/text_style.dart';

import '../res/dimens.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
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
            padding: EdgeInsets.all(MyDimens.small),
            margin: const EdgeInsets.all(MyDimens.small),
            height:size.height*.1,
            width:size.height*.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: colors
              ),borderRadius: BorderRadius.circular(MyDimens.large),
          
          ),child: Image.network(iconPath,height:10,width: 10,),),
              MyDimens.small.height ,
              Text(title,style: MyStyles.title.copyWith(fontSize: 18),) ],);
  }
}