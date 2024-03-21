import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_flutter/widget/surface_container.dart';
import '../gen/assets.gen.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({required this.cartModel});
 final CartModel cartModel;

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return SurfaceContainer(
      child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   FittedBox(child: Text(
                      widget.cartModel.product,textDirection: TextDirection.rtl,
                      style: MyStyles.productTite.copyWith(fontSize: 14),
                    )),
                    Divider(
                      indent: 12,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.cartModel.deleteLoading = true;
                              });
                              cartBloc.add(DeleteFromCartEvent(
                                  widget.cartModel.productId));
                            },
                            icon: SvgPicture.asset(Assets.svg.delete)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.cartModel.countLoading = true;
                              });
                              cartBloc.add(RemoveFromCartEvent(
                                  widget.cartModel.productId));
                            },
                            icon: SvgPicture.asset(Assets.svg.minus)),
                        widget.cartModel.countLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                'عدد ${widget.cartModel.count}',
                                style:
                                    MyStyles.productTite.copyWith(fontSize: 12),
                              ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.cartModel.countLoading = true;
                              });
                              cartBloc.add(
                                  AddToCartEvent(widget.cartModel.productId));
                            },
                            icon: SvgPicture.asset(Assets.svg.plus)),
                      ],
                    ),
                  ],
                )),
                Image.network(
                  widget.cartModel.image,
                  scale: 2.5,
                ),
              ],
            ),
    );
  }
}
