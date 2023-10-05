import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';

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
    return Positioned(
        bottom: size!.height*.1,
        left: 0,
        right: 0,
        child: Container(
color: Colors.white,
child: Row(children: [
  GestureDetector(
    onTap: () {
    
    },
    child: Container(
    height: 30,
    width: 30,
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
             : Colors.white
              , BlendMode.srcIn),)
        ,
        Dimens.small.height,
        Text(text,style: isActive?MyStyles.btmNavActive:MyStyles.btmNavInActive,)
        
        ],
      ),
    ),
    ),
  )
],),
      ));
  }
}