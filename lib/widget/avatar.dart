import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/dimens.dart';

import '../res/string.dart';

class Avatar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Column(children: [

  ClipRRect(
    borderRadius: BorderRadius.circular(1000),
    child: Image.asset(Assets.png.avatar.path),
  ),
  Dimens.medium.height,
  Text(Strings.chooseProfileImage)
],);
  }



}