import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/dimens.dart';

class AppButtonStyle{

static ButtonStyle mainButtonStyle=ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyDimens.medium)))
);


}