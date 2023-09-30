import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/app_text_field.dart';
import '../gen/assets.gen.dart';
import '../res/string.dart';

class SendOtpScreen extends StatelessWidget {
 SendOtpScreen({super.key});
TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Image.asset(Assets.png.mainLogo.path),
            Dimens.large.height,
            AppTextField(lable: Strings.enterYourNumber,
             hint: Strings.hintPhoneNumber,
              textEditingController: controller)
                  ],
                ),
          )),
    );
  }
}
