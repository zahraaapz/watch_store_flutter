import 'package:flutter/widgets.dart';
import 'package:watch_store_flutter/data/conf/remote_conf.dart';
import 'package:watch_store_flutter/data/src/cart_data_src.dart';

import '../model/cart.dart';

abstract class ICartRepository{
  Future<List<CartModel>> getUserCart();
  Future<List<CartModel>> addToCart({required int productId});
  Future<int> countCartItem();
  Future<List<CartModel>> removeFromCart({required int productId});
  Future<List<CartModel>> deleteFromCart({required int productId});
}

final cartRepsitory=CartRepo(CartRemoteDataSrc(DioManager.dio));

class CartRepo implements ICartRepository{

  final ICartDataSrc _iCartDataSrc;
ValueNotifier<int>count=ValueNotifier(0);
  CartRepo(this._iCartDataSrc);
  @override
  Future<List<CartModel>> addToCart({required int productId})=>_iCartDataSrc.addToCart(productId: productId).then((value) {
   
    count.value=value.length;
    return value;
  });

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) =>_iCartDataSrc.deleteFromCart(productId: productId).then((value) {
     count.value=value.length;
    return value;
  });

  @override
  Future<List<CartModel>> getUserCart() =>_iCartDataSrc.getUserCart();
  

  @override
  Future<List<CartModel>> removeFromCart({required int productId})=>_iCartDataSrc.removeFromCart(productId: productId);
  
  @override
  Future<int> countCartItem() {
 
  return _iCartDataSrc.countCartItem().then((value) => count.value=value);
  }
}