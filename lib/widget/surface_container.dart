
import 'package:watch_store_flutter/res/color.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/dimens.dart';

class SurfaceContainer extends StatelessWidget {
  SurfaceContainer({super.key, required this.child});

  final child;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Container(
    
      margin: const EdgeInsets.fromLTRB(
          MyDimens.medium, MyDimens.medium, MyDimens.medium, 0),
      height: size.height * .2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyDimens.medium),
          color: MyColors.surfaceColor),
      child: child,
    );
  }
}
