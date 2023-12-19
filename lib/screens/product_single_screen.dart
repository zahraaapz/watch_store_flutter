import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/cart_badge.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            child: Row(
          children: [
            CartBadge(),
            Expanded(
                child: Text(
              'product name',
              style: MyStyles.productTite,
              textDirection: TextDirection.rtl,
            )),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close))
          ],
        )),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    Assets.png.unnamed.path,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: EdgeInsets.all(MyDimens.medium),
                    padding: EdgeInsets.all(MyDimens.small),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MyDimens.medium),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'data',
                          style: MyStyles.productTite,
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          'data',
                          style: MyStyles.caption,
                          textDirection: TextDirection.rtl,
                        ),
                        const Divider(),
                        ProductTabView()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,left: 0,right: 0,
              child: Container())
          ],
        ),
      ),
    );
  }
}

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
