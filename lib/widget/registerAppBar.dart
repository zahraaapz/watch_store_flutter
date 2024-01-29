
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';

import '../components/text_style.dart';
import '../res/string.dart';

class RegisterationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegisterationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, size.height * .9),
        child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          
          child: SvgPicture.asset(Assets.svg.back,height: 30,)),
            Text(
              MyStrings.register,
              style: MyStyles.title.copyWith(fontSize: 20),
            )
          ],
        ));
  }
  
  @override

  Size get preferredSize => Size.fromHeight(size.height*.1);
}