
import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: preferredSize.height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(MyDimens.small),
                bottomRight: Radius.circular(MyDimens.medium)),
            boxShadow: [
              BoxShadow(
                  color: MyColors.shadow, offset: Offset(0, 2), blurRadius: 3)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MyDimens.medium),
          child: child,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}