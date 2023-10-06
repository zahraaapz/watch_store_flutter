import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/color.dart';

import '../components/text_style.dart';
import '../res/dimens.dart';

class BtmNavItem extends StatelessWidget {

  final String iconPath;
  final String text;
  final bool isActive;
  final void Function() onTap;


const BtmNavItem({
  
    required this.onTap,
  required this.text,
    required this.iconPath,
    required this.isActive,
    this.size

  });

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      
      height:size!.height/11,
      
      width: size!.width/4,
      
      color:Colors.white ,
      
      child: Padding(
      
        padding: const EdgeInsets.all(4.0),
      
        child: Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      
      
      
      children: [
      
        SvgPicture.asset(
      
          
      
         iconPath,colorFilter:
      
        
      
          ColorFilter.mode(
      
             isActive?
      
            Colors.black
      
           : MyColors.btmNavInActiveItem
      
            , BlendMode.srcIn),)
      
      ,
      
      Dimens.small.height,
      
      Text(text,style: isActive?MyStyles.btmNavActive:MyStyles.btmNavInActive,)
      
      
      
      ],
      
        ),
      
      ),
      
      ),
    );
  }
}