import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/button_style.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/repo/cart_repo.dart';
import 'package:watch_store_flutter/data/repo/product_repo.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_flutter/screens/product_single/bloc/product_single_bloc.dart';
import 'package:watch_store_flutter/widget/cart_badge.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';

import '../../widget/productTabView.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final productDetailesBolc = ProductSingleBloc(productRepository);
            productDetailesBolc.add(ProductSingleInit(id: id));
            return productDetailesBolc;
          },
        ),
        BlocProvider(create: (context) {
          final cartbloc=
         CartBloc(cartRepsitory);
         cartbloc.add(CartItemCountEvent());
         return cartbloc;
        }),
      ],
      child: BlocBuilder<ProductSingleBloc, ProductSingleState>(
            builder: (context, state) {
          if (state is ProductSingleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSingleLoaded) {
            return SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                    child: Row(
                  children: [
                     ValueListenableBuilder(
                      valueListenable: cartRepsitory.count,
                      builder: (context, value, child) =>  CartBadge(count: value,)),
                    Expanded(
                        child: FittedBox(
                      child: Text(
                        state.productDetailes.title!,
                        style: MyStyles.productTite,
                        textDirection: TextDirection.rtl,
                      ),
                    )),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(Assets.svg.close))
                  ],
                )),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                    
                      child: Column(
                        children: [
                          Image.network(
                            state.productDetailes.image!,
                            scale: 1,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: const EdgeInsets.all(MyDimens.medium),
                            padding: const EdgeInsets.all(MyDimens.small),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(MyDimens.medium),
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  state.productDetailes.brand!,
                                  style: MyStyles.productTite,
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  state.productDetailes.title!,
                                  style: MyStyles.caption,
                                  textDirection: TextDirection.rtl,
                                ),
                                const Divider(),
                                ProductTabView(productDetailes: state.productDetailes),
                                60.0.height
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocConsumer<CartBloc, CartState>(
                      listener: (cartcontext, cartstate) {
                        if (cartstate is CartItemAddedState) {
                          ScaffoldMessenger.of(cartcontext)
                              .showSnackBar(SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: const Duration(milliseconds: 500),
                                  content: Text(
                                    'به سبد خرید اضافه شده',
                                    style: MyStyles.caption,
                                    textAlign: TextAlign.center,
                                  )));
                        }
                      },
                      builder: (cartcontext, cartstate) {
                        if (cartstate is CartLoadingState) {
                          return const Positioned(
                              bottom: 0,
                              left: MyDimens.large,
                              right: MyDimens.large,
                              child: LinearProgressIndicator());
                        }

                        return Positioned(
                            bottom: 0,
                            left: MyDimens.large,
                            right: MyDimens.large,
                            child: ElevatedButton(
                              style: AppButtonStyle.mainButtonStyle,
                              onPressed: () {
                                BlocProvider.of<CartBloc>(cartcontext).add(
                                    AddToCartEvent(state.productDetailes.id!));
                              },
                              child: const Text(
                                'افزودن به سبد خرید',
                                style: MyStyles.mainButton,
                              ),
                            ));
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return throw Exception('Error');
          }
        },
      ),
    );
  }
}
