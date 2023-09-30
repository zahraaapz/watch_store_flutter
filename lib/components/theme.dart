import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';

ThemeData LightTheme(){

return ThemeData(

 brightness: Brightness.light,
 iconTheme: const IconThemeData(color:Colors.black),
scaffoldBackgroundColor: MyColors.appbar,
 primaryColor: MyColors.focusedBorderColor,
 inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: MaterialStateColor.resolveWith((states) {

if (states.contains(MaterialState.focused)) {
  return MyColors.focusedBorderColor;

}
else{
  return MyColors.borderColor;
}


  }),
contentPadding: const EdgeInsets.all(Dimens.medium),
enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(Dimens.medium),
  borderSide: const BorderSide(color: MyColors.borderColor)
),
focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(Dimens.medium),
  borderSide: const BorderSide(color: MyColors.focusedBorderColor)
) 
 )








);





}