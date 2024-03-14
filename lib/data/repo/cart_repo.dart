import 'package:watch_store_flutter/data/conf/remote_conf.dart';
import 'package:watch_store_flutter/data/src/cart_data_src.dart';

import '../model/cart.dart';

abstract class ICartRepository{
  Future<List<CartModel>> getUserCart();
  Future<void> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<void> deleteFromCart({required int productId});
}

final cartRepsitory=CartRepo(CartRemoteDataSrc(DioManager.dio));

class CartRepo implements ICartRepository{

  final ICartDataSrc _iCartDataSrc;

  CartRepo(this._iCartDataSrc);
  @override
  Future<void> addToCart({required int productId})=>_iCartDataSrc.addToCart(productId: productId);

  @override
  Future<void> deleteFromCart({required int productId}) =>_iCartDataSrc.deleteFromCart(productId: productId);

  @override
  Future<List<CartModel>> getUserCart() =>_iCartDataSrc.getUserCart();
  

  @override
  Future<void> removeFromCart({required int productId})=>_iCartDataSrc.removeFromCart(productId: productId);
}