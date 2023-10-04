import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/theme.dart';
import 'package:watch_store_flutter/screens/get_otp_screen.dart';
import 'package:watch_store_flutter/screens/register_screen%20.dart';
import 'package:watch_store_flutter/screens/send_otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Store',
      theme: LightTheme(),
      home: RegisterScreen(),
    );
  }
}
