import 'package:flutter/widgets.dart';
import 'package:watch_store_flutter/data/conf/remote_conf.dart';
import 'package:watch_store_flutter/data/src/cart_data_src.dart';

import '../model/cart.dart';

abstract class ICartRepository{
  Future<List<CartModel>> getUserCart();
  Future<int> addToCart({required int productId});
  Future<int> countCartItem();
  Future<void> removeFromCart({required int productId});
  Future<int> deleteFromCart({required int productId});
}

final cartRepsitory=CartRepo(CartRemoteDataSrc(DioManager.dio));

class CartRepo implements ICartRepository{

  final ICartDataSrc _iCartDataSrc;
ValueNotifier<int>count=ValueNotifier(0);
  CartRepo(this._iCartDataSrc);
  @override
  Future<int> addToCart({required int productId})=>_iCartDataSrc.addToCart(productId: productId).then((value) => count.value=value);

  @override
  Future<int> deleteFromCart({required int productId}) =>_iCartDataSrc.deleteFromCart(productId: productId).then((value) => count.value=value);

  @override
  Future<List<CartModel>> getUserCart() =>_iCartDataSrc.getUserCart();
  

  @override
  Future<void> removeFromCart({required int productId})=>_iCartDataSrc.removeFromCart(productId: productId);
  
  @override
  Future<int> countCartItem() {
 
  return _iCartDataSrc.countCartItem().then((value) => count.value=value);
  }
}