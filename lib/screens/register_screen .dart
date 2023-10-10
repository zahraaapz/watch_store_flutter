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
          MyDimens.medium.height,
          Avatar(),
          AppTextField(
              lable: MyStrings.nameLastName,
              hint: MyStrings.hintNameLastName,
              controller: controller),
          AppTextField(
              lable: MyStrings.homeNumber,
              hint: MyStrings.hintHomeNumber,
              controller: controller),
          AppTextField(
              lable: MyStrings.address,
              hint: MyStrings.hintAddress,
              controller: controller),
          AppTextField(
              lable: MyStrings.postalCode,
              hint: MyStrings.hintPostalCode,
              controller: controller),
          AppTextField(
              icon: const Icon(Icons.location_on),
              lable: MyStrings.location,
              hint: MyStrings.hintLocation,
              controller: controller),
          MainButton(text: MyStrings.next, onPressed: () {
            Navigator.pushNamed(context, Screens.mainScreen);
          }),
          MyDimens.small.height
        ]),
      ),
    ));
  }
}

