import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/app_text_field.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../../gen/assets.gen.dart';
import '../../res/string.dart';
import '../../routes/names.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  final mobileRouteArg=ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.png.mainLogo.path),
           MyDimens.medium.height,
          Text(MyStrings.otpCodeSendFor.replaceAll(MyStrings.replace, mobileRouteArg),style: MyStyles.title,),
           MyDimens.small.height,
          const Text(MyStrings.wrongNumberEditNumber,style: MyStyles.primaryThemeTextStyle),
          MyDimens.large.height,
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
