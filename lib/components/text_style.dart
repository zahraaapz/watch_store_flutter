import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/color.dart';
import '../gen/fonts.gen.dart';

abstract class MyStyles {
  static const TextStyle btmNavActive =
      TextStyle(fontFamily: FontFamily.dana, fontSize: 14, color: Colors.black);

  static const TextStyle btmNavInActive =
      TextStyle(fontFamily: FontFamily.dana, fontSize: 14, color: Colors.grey);

  static const TextStyle title =
      TextStyle(fontFamily: FontFamily.dana, fontSize: 14, color: Colors.black);

  static const TextStyle buttonText =
      TextStyle(fontFamily: FontFamily.dana, fontSize: 14, color: Colors.white);

  static const TextStyle hint =
      TextStyle(fontFamily: FontFamily.dana, fontSize: 14, color: Colors.grey);

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
