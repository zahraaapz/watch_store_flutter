import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';

class AppTextField extends StatelessWidget{

final String lable;
final String prefixLable;
final String hint;
TextEditingController controller;
final Widget icon;
final TextAlign textAlign;
final TextInputType? inputType;
AppTextField({
  super.key, 
  required this.lable,
  required this.hint,
  required this.controller,
  this.icon=const SizedBox(),
  this.prefixLable='',
  this.textAlign=TextAlign.center,
this.inputType,
});
  @override
  Widget build(BuildContext context) {
        var size=MediaQuery.sizeOf(context);

return Padding(
  padding:  EdgeInsets.all(Dimens.medium),
  child:   Column(
  crossAxisAlignment: CrossAxisAlignment.end,
    children: [
  SizedBox(
    width: size.width*.75,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(prefixLable),
        Text(lable),
      ],
    ),
  ),
  Dimens.medium.height,
  SizedBox(
width: size.width*.07,
height: size.width*.75,
child: TextField(
textAlign: textAlign,
controller: controller,
keyboardType: inputType,
decoration: InputDecoration(
  hintText: hint
),




),
  )
      
  
    ],
  
  ),
);
  }

}