import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/app_text_field.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../gen/assets.gen.dart';
import '../res/string.dart';
import '../routes/names.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.png.mainLogo.path),
           Dimens.medium.height,
          Text(MyStrings.otpCodeSendFor.replaceAll(MyStrings.replace, '0615995'),style: MyStyles.title,),
           Dimens.small.height,
          Text(MyStrings.wrongNumberEditNumber,style: MyStyles.primaryThemeTextStyle),
          Dimens.large.height,
          AppTextField(
           prefixLable: '2:55',
              lable: MyStrings.enterVerificationCode,
              hint: MyStrings.hintVerificationCode,
              controller: controller),
              MainButton(text: MyStrings.next, onPressed: (){
                                  Navigator.pushNamed(context, Screens.registerUserScreen);

              })
        ],
          ),
        ),
      ),
    );
  }
}
