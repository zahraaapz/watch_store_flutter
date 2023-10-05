
import 'package:flutter/material.dart';

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
        preferredSize: Size(double.infinity, size.height * .1),
        child: Row(
          children: [
            IconButton(onPressed: () {
                                Navigator.pop(context);

            }, icon: Icon(Icons.arrow_back)),
            Text(
              Strings.register,
              style: MyStyles.title,
            )
          ],
        ));
  }
  
  @override

  Size get preferredSize => Size.fromHeight(size.height*.1);
}