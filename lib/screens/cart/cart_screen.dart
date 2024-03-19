import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
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
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: MyDimens.medium),
              padding: const EdgeInsets.all(MyDimens.medium),
              width: double.infinity,
              height: size.height * .1,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 3), blurRadius: 3)
              ]),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                } 
                else if (state is CartItemAddedState) {
                  return CartList(list: state.cartList);
                } 
                else if (state is CartItemDeleted) {
                  return CartList(list: state.cartList);
                }
                 else if (state is CartItemRemovedState) {
                  return CartList(list: state.cartList);
                }
                 else if (state is CartErrorState) {
                  return Text('data');
                }
                 else if (state is CartLoadingState) {
                  return const LinearProgressIndicator();
                } 
                else {
                  return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context).add(CartInitEvent());
                      },
                      child: const Text('تلاش محدد'));
                }
              },
            ),
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

class CartList extends StatelessWidget {
  CartList({super.key, required this.list});
  List<CartModel> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final cartbloc = BlocProvider.of<CartBloc>(context);
        return ShoppingCartItem(
          productTite: 'ساعت شیائومی mi Watch lite',
          count: list[index].count,
          add: () {
            cartbloc.add(AddToCartEvent(list[index].productId));
          },
          remove: () {
            cartbloc.add(RemoveFromCartEvent(list[index].productId));
          },
          delete: () {
            cartbloc.add(DeleteFromCartEvent(list[index].productId));
          },
        );
      },
    ));
  }
}
