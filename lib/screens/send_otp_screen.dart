import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/widget/app_text_field.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../gen/assets.gen.dart';
import '../res/string.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.mainLogo.path),
            MyDimens.large.height,
         
            AppTextField(
              icon: Icon(Icons.inbox),
                lable: MyStrings.enterYourNumber,
                hint: MyStrings.hintPhoneNumber,
                controller: controller),
                MainButton(text: MyStrings.next, onPressed: (){
                  Navigator.pushNamed(context, Screens.getOtpScreen);
                })
          ],
        ),
      )),
    );
  }
}
