import 'package:flutter/material.dart';
import 'package:watch_store_flutter/screens/product_list_screen.dart';

import 'components/theme.dart';



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
      // initialRoute:Screens.root ,
      // routes:routes 
      home:ProductListScreen()
    ,

    );
  }
}
