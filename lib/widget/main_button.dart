import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/button_style.dart';

class mainButton extends StatelessWidget{
void Function() onPressed;
final String text;
  mainButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
Size size=MediaQuery.sizeOf(context);
return SizedBox(
width: size.width*.7,
height: size.height*.075,
child: ElevatedButton(
  style: AppButtonStyle.mainButtonStyle,
  onPressed: onPressed, child: Text(text)),
);
  }

}