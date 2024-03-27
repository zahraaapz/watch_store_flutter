
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';
import '../../gen/assets.gen.dart';
import '../../widget/shoppingCartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                      return CartList(list: state.cartList.cartList);
                    } else if (state is CartItemAddedState) {
                      return CartList(list: state.cartList.cartList);
                    } else if (state is CartItemDeleted) {
                      return CartList(list: state.cartList.cartList);
                    } else if (state is CartItemRemovedState) {
                      return CartList(list: state.cartList.cartList);
                    } else if (state is CartErrorState) {
                      return Center(child: Text(state.e));
                    } else if (state is CartLoadingState) {
                      return const LinearProgressIndicator();
                    } else {
                   return const LinearProgressIndicator();
                    }
                  },
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: BlocConsumer<CartBloc, CartState>(
                      listener: (contxt, state) async {
                        if (state is ReceivePayLinkState) {
                          final url = Uri.parse(state.url);
                          if (!await launchUrl(url)) {
                            throw Exception('not launch');
                          }
                        }
                      },
                      builder: (contxt, state) {
                        UserCart? userCart;
                        switch (state.runtimeType) {
                          case CartLoadedState:
                          case CartItemAddedState:
                          case CartItemDeleted:
                          case CartItemRemovedState:
                            userCart = (state as dynamic).userCart;

                            break;
                          case CartErrorState:
                            return const Text('Error');
                          case CartLoadingState:
                            return const LinearProgressIndicator();
                          default:
                            return const SizedBox();
                        }
                        return Visibility(
                            visible: (userCart!.cartTotalPrice) > 0,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: MyColors.surfaceColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<CartBloc>(context)
                                            .add(PayEvent());
                                      },
                                      child: const Text('پرداخت')),
                                  Column(
                                    children: [
                                      Text("قیمت: ${userCart.cartTotalPrice.separateWithComma} تومان"),
                                      Visibility(
                                          visible: userCart
                                                  .totalWithoutDiscountPrice !=
                                              userCart.cartTotalPrice,
                                          child: Text("قیمت: ${userCart.totalWithoutDiscountPrice.separateWithComma} تومان")),
                                    ],
                                  )
                                ],
                              ),
                            ));
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
  const CartList({super.key, required this.list});
 final List<CartModel> list;
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
