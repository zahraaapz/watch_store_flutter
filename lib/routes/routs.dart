



import 'package:flutter/material.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/screens/get_otp_screen.dart';
import 'package:watch_store_flutter/screens/register_screen%20.dart';
import 'package:watch_store_flutter/screens/send_otp_screen.dart';

Map<String,Widget  Function(BuildContext)> routes={


Screens.root:(context)=>SendOtpScreen(),
Screens.getOtpScreen:(context)=>GetOtpScreen(),
Screens.registerUser:(context)=>RegisterScreen(),








};