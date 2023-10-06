import 'package:flutter/material.dart';
import 'package:watch_store_flutter/screens/product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(onPressed: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));

      },
       child: Text('llll')),
    );
  }
}