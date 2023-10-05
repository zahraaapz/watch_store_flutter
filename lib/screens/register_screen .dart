import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/widget/avatar.dart';
import 'package:watch_store_flutter/widget/main_button.dart';

import '../res/string.dart';
import '../widget/app_text_field.dart';
import '../widget/registerAppBar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: RegisterationAppBar(size: size),
      body: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Dimens.large.height,
          Avatar(),
          AppTextField(
              lable: Strings.nameLastName,
              hint: Strings.hintNameLastName,
              controller: controller),
          AppTextField(
              lable: Strings.homeNumber,
              hint: Strings.hintHomeNumber,
              controller: controller),
          AppTextField(
              lable: Strings.address,
              hint: Strings.hintAddress,
              controller: controller),
          AppTextField(
              lable: Strings.postalCode,
              hint: Strings.hintPostalCode,
              controller: controller),
          AppTextField(
              icon: Icon(Icons.location_on),
              lable: Strings.location,
              hint: Strings.hintLocation,
              controller: controller),
          MainButton(text: Strings.next, onPressed: () {
            Navigator.pushNamed(context, Screens.mainScreen);
          }),
          Dimens.large.height
        ]),
      ),
    ));
  }
}

