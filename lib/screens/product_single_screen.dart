import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/cart_badge.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';

import '../widget/productTabView.dart';

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


