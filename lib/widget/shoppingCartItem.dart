import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/widget/surface_container.dart';

import '../gen/assets.gen.dart';
import '../res/color.dart';

class ShoppingCartItem extends StatelessWidget {
  ShoppingCartItem({super.key,required this.oldprice,required this.price,required this.productTite});
  int count = 0;
  int oldprice;
  int price;
  String productTite;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                
                productTite,
                style: MyStyles.productTite.copyWith(fontSize: 12),
              ),
              Text(
                'قیمت : ${price.separateWithComma}  تومان',
                style: MyStyles.caption,
              ),
              Text('تخفیف : ${oldprice.separateWithComma}  تومان',
                  style:
                      MyStyles.caption.copyWith(color: MyColors.primaryColor)),
              Divider(),
              Row(
                children: [SvgPicture.asset(Assets.svg.delete)],
              )
            ],
          )),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(Assets.svg.delete)),
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(Assets.svg.minus)),
              Text('عدد $count'),
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(Assets.svg.plus)),
            ],
          ),
        ],
      ),
    );
  }
}