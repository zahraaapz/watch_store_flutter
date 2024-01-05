import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';
import '../gen/assets.gen.dart';
import '../widget/shoppingCartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            MyStrings.basket,
            style: MyStyles.title,
          ),
        )),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: MyDimens.medium),
              padding: const EdgeInsets.all(MyDimens.medium),
              width: double.infinity,
              height: size.height * .1,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 3)
              ]),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.svg.leftArrow)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            MyStrings.sendToAddress,
                            style: MyStyles.caption,
                          ),
                          Text(
                            MyStrings.lurem,
                            style: MyStyles.caption,
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  productTite: 'ساعت شیائومی mi Watch lite',
                  price: 10000,
                  oldprice: 500000,
                );
              },
            )),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}



class SurfaceContainer extends StatelessWidget {
  SurfaceContainer({super.key, required this.child});

  final child;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(
          MyDimens.medium, MyDimens.medium, MyDimens.medium, 0),
      height: size.height * .2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyDimens.medium),
          color: MyColors.surfaceColor),
      child: child,
    );
  }
}
