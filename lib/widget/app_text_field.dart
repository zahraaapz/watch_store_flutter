import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';

class AppTextField extends StatelessWidget{

final String lable;
final String hint;
TextEditingController textEditingController;
final Widget icon;
final TextAlign textAlign;
final TextInputType? inputType;
AppTextField({
  super.key, 
  required this.lable,
  required this.hint,
  required this.textEditingController,
  this.icon=const SizedBox(),
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
  Text(lable),
  Dimens.medium.height,
  SizedBox(
width: size.width*.07,
height: size.width*.75,
child: TextField(
textAlign: textAlign,
controller: textEditingController,
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