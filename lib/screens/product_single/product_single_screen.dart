import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/repo/product_repo.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/screens/product_single/bloc/product_single_bloc.dart';
import 'package:watch_store_flutter/widget/cart_badge.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';

import '../../widget/productTabView.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productDetailesBolc = ProductSingleBloc(productRepository);
        productDetailesBolc.add(ProductSingleInit(id: id));
        return productDetailesBolc;
      },
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          if (state is ProductSingleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSingleLoaded) {
            return SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(
                    child: Row(
                  children: [
                    const CartBadge(),
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
                            margin: EdgeInsets.all(MyDimens.medium),
                            padding: EdgeInsets.all(MyDimens.small),
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
                                ProductTabView( productDetailes:state.productDetailes)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(bottom: 0, left: 0, right: 0, child: Container())
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
