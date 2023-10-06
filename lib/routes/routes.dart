



import 'package:flutter/material.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/screens/get_otp_screen.dart';
import 'package:watch_store_flutter/screens/product_list_screen.dart';
import 'package:watch_store_flutter/screens/product_single_screen.dart';
import 'package:watch_store_flutter/screens/register_screen%20.dart';
import 'package:watch_store_flutter/screens/send_otp_screen.dart';

import '../screens/mainscreen/main_screen.dart';

Map<String,Widget  Function(BuildContext)> routes={


Screens.root:(context)=>SendOtpScreen(),
Screens.getOtpScreen:(context)=>GetOtpScreen(),
Screens.mainScreen:(context)=>MainScreen(),
Screens.productListScreen:(context)=>ProductListScreen(),
Screens.productSingleScreen:(context)=>ProductSingleScreen(),
Screens.registerUserScreen:(context)=>RegisterScreen(),








};