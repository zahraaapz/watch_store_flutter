import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/widget/product_item.dart';

import '../gen/assets.gen.dart';

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

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(MyDimens.small),
                bottomRight: Radius.circular(MyDimens.medium)),
            boxShadow: [
              BoxShadow(
                  color: MyColors.shadow, offset: Offset(0, 2), blurRadius: 3)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MyDimens.medium),
          child: child,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, this.count = 0});
  final count;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyDimens.small.width,
        SvgPicture.asset(
          Assets.svg.smart,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        Visibility(
            visible: count > 0 ? true : false,
            child: Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }
}

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MyDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
          reverse: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(MyDimens.large)),
              margin: const EdgeInsets.symmetric(horizontal: MyDimens.small),
              padding: const EdgeInsets.symmetric(horizontal: MyDimens.small),
            );
          },
        ),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.7,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return productItem(productName: 'productName', price: 100);
        },
      ),
    );
  }
}
