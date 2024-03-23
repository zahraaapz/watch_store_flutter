import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/data/repo/cart_repo.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';
import '../../gen/assets.gen.dart';
import '../../widget/shoppingCartItem.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  int t = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CartInitEvent());
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
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: MyDimens.medium),
                  padding: const EdgeInsets.all(MyDimens.medium),
                  width: double.infinity,
                  height: size.height * .1,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
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
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoadedState) {
                      return CartList(list: state.cartList);
                    } else if (state is CartItemAddedState) {
                      return CartList(list: state.cartList);
                    } else if (state is CartItemDeleted) {
                      return CartList(list: state.cartList);
                    } else if (state is CartItemRemovedState) {
                      return CartList(list: state.cartList);
                    } else if (state is CartErrorState) {
                      return Center(child: Text(state.e));
                    } else if (state is CartLoadingState) {
                      return const LinearProgressIndicator();
                    } else {
                      return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(CartInitEvent());
                          },
                          child: Text('تلاش محدد', style: MyStyles.caption));
                    }
                  },
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: BlocConsumer<CartBloc, CartState>(
                      listener: (contxt, state) {
                        if (state is CartItemTotalPriceState) {
                          t = state.totalPrice;
                        }
                      },
                      builder: (contxt, state) {
                        return Container(
                          padding: const EdgeInsets.only(right:18),
                          color: MyColors.surfaceColor,
                          width: 410,
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('قیمت: ${t.separateWithComma}',
                                    style: MyStyles.caption)
                              ]),
                        );
                      },
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({super.key, required this.list});
  List<CartModel> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ShoppingCartItem(
          cartModel: list[index],
        );
      },
    ));
  }
}
