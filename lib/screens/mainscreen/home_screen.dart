import 'package:flutter/material.dart';

import '../../widget/app_slider.dart';
import '../../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Scaffold(
          body: Column(
            children: [
              searchBtn(onTap:(){} ,),
              AppSlider()
            ],
          ),
        ),
      ),
    );
  }
}



