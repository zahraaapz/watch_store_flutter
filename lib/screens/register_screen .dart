import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/avatar.dart';
import 'package:watch_store_flutter/widget/main_button.dart';

import '../res/string.dart';
import '../widget/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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

              mainButton(text: Strings.next, onPressed: (){}),
              Dimens.large.height
        ]),
      ),
    ));
  }
}
