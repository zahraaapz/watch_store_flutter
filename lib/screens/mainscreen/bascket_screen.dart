import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/text_style.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Column(children: [
          Center(
            
            
            child: Text('data',style: MyStyles.btmNavActive,))
     
     
     
     
     
        ],),
      ),
    );
  }
}