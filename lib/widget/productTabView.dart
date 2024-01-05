import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/dimens.dart';

import '../components/text_style.dart';

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
 
 var selectedIndex=2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.sizeOf(context).width * .333,
          child: ListView.builder(
          itemCount:tabs.length ,
          itemExtent: MediaQuery.sizeOf(context).width /tabs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex=index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(MyDimens.medium),
                child: Text(tabs[index],
                style: index==selectedIndex? MyStyles.selectedTab:MyStyles.unselectedTab,),
              ),
            ),
          ),
        ),
        IndexedStack(index: selectedIndex,
        children: [

        ],)
      ],
    );
  }
}

List<String> tabs = ['خصوصیات', 'نظرات', 'نقد و برسی'];