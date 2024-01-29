import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/app_text_field.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../../gen/assets.gen.dart';
import '../../res/string.dart';
import '../../routes/names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/screens/auth/cubit/auth_cubit.dart';

class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
 final TextEditingController controller = TextEditingController();

late Timer timer;
int startTime=120;

String formatTimer(int sec){
int min=sec~/60;
int seconds=sec%60;

String minStr=min.toString().padLeft(2,'0');
String seccondStr=seconds.toString().padLeft(2,'0');


return '$minStr:$seccondStr';
}
startTimer(){
timer=Timer.periodic(const Duration(seconds: 1),(timer){
setState(() {
 if (startTime==0) {
  timer.cancel();
  Navigator.of(context).pop();
} else {
  startTime--;
} 
});



});
}
@override
  void initState() {

    super.initState();
startTimer();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }


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
          GestureDetector(
            onTap:()=> Navigator.of(context).pop(),
            child: const Text(MyStrings.wrongNumberEditNumber,style: MyStyles.primaryThemeTextStyle)),
          MyDimens.large.height,
          AppTextField(
           prefixLable: formatTimer(startTime),
              lable: MyStrings.enterVerificationCode,
              hint: MyStrings.hintVerificationCode,
              controller: controller),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
               
                  if (state is VerifiedIsRegisterState) {
                     Navigator.pushNamed(context, Screens.mainScreen);
                  } else if (state is VerifiedNotRegisterState) {
                     Navigator.pushNamed(context, Screens.registerUserScreen);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                       return const Center(child: CircularProgressIndicator(),);

                  }
                     return MainButton(text: MyStrings.next, onPressed: (){
                                  BlocProvider.of<AuthCubit>(context).verifycode(mobileRouteArg, controller.text);
                
                });
                }
              )
        ],
          ),
        ),
      ),
    );
  }
}
