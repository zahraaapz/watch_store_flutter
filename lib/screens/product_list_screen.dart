import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/dimens.dart';

import '../gen/assets.gen.dart';
import '../widget/Gridview_list.dart';
import '../widget/cart_badge.dart';
import '../widget/custom_app_bar.dart';
import '../widget/taglist.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartBadge(count: 1),
          Row(
            children: [
              Text('پرفروش ترین ها'),
              MyDimens.small.width,
              SvgPicture.asset(Assets.svg.sort)
            ],
          ),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close))
        ],
      )),
      body: Column(
        children: [TagList(), ProductGridView()],
      ),
    ));
  }
}




