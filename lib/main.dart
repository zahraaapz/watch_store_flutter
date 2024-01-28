import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_flutter/screens/auth/send_sms_screen.dart';
import 'package:watch_store_flutter/screens/mainscreen/main_screen.dart';

import 'components/theme.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Watch Store',
        theme: LightTheme(),
        // initialRoute:Screens.root ,
        routes: routes,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoggedINState) {
              return MainScreen();
            } else if (state is LoggedOutState) {
              return SendSmsScreen();
            } else {
              return SendSmsScreen();
            }
          },
        ),
      ),
    );
  }
}
