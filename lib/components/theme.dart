import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';

ThemeData LightTheme(){

return ThemeData(

 brightness: Brightness.light,
 iconTheme: const IconThemeData(color:Colors.black),
scaffoldBackgroundColor: MyColors.scaffoldBgColor,
 primaryColor: MyColors.primaryColor,
 inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: MaterialStateColor.resolveWith((states) {

if (states.contains(MaterialState.focused)) {
  return MyColors.focusedTextFiled;

}
else{
  return MyColors.unfocusedTextFiled;
}


  }),
contentPadding: const EdgeInsets.all(Dimens.medium),
enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(Dimens.medium),
  borderSide: const BorderSide(color: MyColors.borderColor)
),
focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(Dimens.medium),
  borderSide: const BorderSide(color: MyColors.primaryColor)
) 
 )








);





}