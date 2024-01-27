import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.svgIcon});
  final svgIcon;
  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MyDimens.small),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: MyStyles.title,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.right,
            )),
            MyDimens.small.width,
            SvgPicture.asset(svgIcon)
          ],
        ),
      ),
    );
  }
}