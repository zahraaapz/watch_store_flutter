



import 'package:flutter/material.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/screens/product_list/product_list_screen.dart';
import 'package:watch_store_flutter/screens/product_single_screen.dart';
import 'package:watch_store_flutter/screens/register/register_screen%20.dart';
import '../screens/auth/send_sms_screen.dart';

import '../screens/auth/verify_code_screen.dart';
import '../screens/mainscreen/main_screen.dart';

Map<String,Widget  Function(BuildContext)> routes={


Screens.sendSmsScreen:(context)=>SendSmsScreen(),
Screens.verifyCodeScreen:(context)=>VerifyCodeScreen(),
Screens.mainScreen:(context)=>MainScreen(),
Screens.productListScreen:(context)=>const ProductListScreen(),
Screens.productSingleScreen:(context)=>const ProductSingleScreen(),
Screens.registerUserScreen:(context)=>RegisterScreen(),








};