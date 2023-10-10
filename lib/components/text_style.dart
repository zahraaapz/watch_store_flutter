import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/color.dart';
import '../gen/fonts.gen.dart';

abstract class MyStyles {


  static const TextStyle btmNavActive =
      TextStyle(fontFamily: FontFamily.dana,
       fontSize: 14, color: Colors.black);

static const TextStyle oldPrice =
      TextStyle(
        fontFamily: FontFamily.dana,
       fontSize: 12,
        color: MyColors.oldPrice,
        decoration: TextDecoration.lineThrough);


 static const TextStyle prodTimeStyle =
      TextStyle(
        fontFamily: FontFamily.dana,
       fontSize: 14,
        color: Colors.blue,
        decoration: TextDecoration.lineThrough);
        
 static const TextStyle amazingStyle =
      TextStyle(
        fontFamily: FontFamily.dana,
       fontSize: 22,
        color: MyColors.amazingColor,
  );
       
       
       
     static const TextStyle productTite=
      TextStyle(fontFamily: FontFamily.dana,
       fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal);

  static const TextStyle btmNavInActive =
      TextStyle(fontFamily: FontFamily.dana,
       fontSize: 14, color: Colors.grey);

  static const TextStyle title =
      TextStyle(fontFamily: FontFamily.dana, 
      fontSize: 14, color: Colors.black);

  static const TextStyle buttonText =
      TextStyle(fontFamily: FontFamily.dana,
       fontSize: 14, color: Colors.white);

  static const TextStyle hint =
      TextStyle(fontFamily: FontFamily.dana, 
      fontSize: 14, color: Colors.grey);

  static const TextStyle avatarText = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 11,
      color: MyColors.title,
      fontWeight: FontWeight.w400);

  static const TextStyle mainButton = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static const TextStyle primaryThemeTextStyle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 11,
      color: MyColors.primaryColor,
      fontWeight: FontWeight.w500);
}
