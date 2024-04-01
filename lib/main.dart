import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/data/repo/cart_repo.dart';
import 'package:watch_store_flutter/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_flutter/screens/auth/send_sms_screen.dart';
import 'package:watch_store_flutter/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_flutter/screens/mainscreen/main_screen.dart';
import 'package:watch_store_flutter/utils/shared_preference.dart';
import 'components/theme.dart';
import 'routes/names.dart';
import 'routes/routes.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
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
        initialRoute:Screens.root ,
        routes: routes,
         home:
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoggedINState) {
              return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                     create: (context) {
                      final cartbloc=CartBloc(cartRepsitory);
                      cartbloc.add(CartInitEvent());
                      cartbloc.add(CartItemCountEvent());
                      return cartbloc;
                    })],
                  child: MainScreen());
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
