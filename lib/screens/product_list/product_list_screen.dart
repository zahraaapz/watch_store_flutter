import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/repo/cart_repo.dart';
import 'package:watch_store_flutter/data/repo/product_repo.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/screens/product_list/bloc/product_list_bloc.dart';
import '../../gen/assets.gen.dart';
import '../../widget/Gridview_list.dart';
import '../../widget/cart_badge.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/taglist.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, this.param});
  final param;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productRepo = ProductListBloc(productRepository);
        productRepo.add(ProductListInit(param: param));
        return productRepo;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
                valueListenable: cartRepsitory.count,
                builder: (context, value, child) => CartBadge(
                      count: value,
                    )),
            Row(
              children: [
                Text(
                  'پرفروش ترین ها',
                  style: MyStyles.title,
                ),
                MyDimens.small.width,
                SvgPicture.asset(Assets.svg.sort)
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(Assets.svg.close))
          ],
        )),
        body: Column(
          children: [TagList(), ProductGridView()],
        ),
      )),
    );
  }
}
