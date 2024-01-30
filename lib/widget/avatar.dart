import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/dimens.dart';

import '../components/text_style.dart';
import '../res/string.dart';

class Avatar extends StatelessWidget{
Avatar({required this.file,required this.onTap});
  final file;
  final onTap;
  @override
  Widget build(BuildContext context) {
return GestureDetector(
  onTap: onTap,
  child: Column(children: [
  
    SizedBox(
      width: MediaQuery.sizeOf(context).width*.3,
      height: MediaQuery.sizeOf(context).height*.15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: file==null?
         Image.asset(Assets.png.avatar.path,fit:BoxFit.fill ,):Image.file(file,fit:BoxFit.fill),
      ),
    ),
    MyDimens.medium.height,
    Text(MyStrings.chooseProfileImage,style: MyStyles.avatarText)
  ],),
);
  }



}