import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_flutter/widget/app_text_field.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../../gen/assets.gen.dart';
import '../../res/string.dart';

class SendSmsScreen extends StatelessWidget {
  SendSmsScreen({super.key});
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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {

                if (state is SentState) {
                  Navigator.pushNamed(context,Screens.verifyCodeScreen,arguments: state.mobile);
                }
               else if(state is ErrorState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(milliseconds: 800),
                  backgroundColor: Colors.red
                  ,content: Text('خطا')));
               }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                return MainButton(text: MyStrings.next, onPressed: () {
                  BlocProvider.of<AuthCubit>(context).sensSms(controller.text);
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
