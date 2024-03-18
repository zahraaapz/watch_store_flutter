import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/utils/response_validator.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();
  Future<void> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<void> deleteFromCart({required int productId});
}


class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<void> addToCart({required int productId}) async {
    try {
          await httpClient
        .post(Endpoints.addToCart, data: {'product_id': productId}).then(
            (value) =>
                HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0));
    } catch (e) {
      print(e.toString());
    }

               
  }

  @override
  Future<void> deleteFromCart({required int productId}) async {
    await httpClient
        .post(Endpoints.deleteFromCart, data: {'product_id': productId}).then(
            (value) =>
                HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0));
  }

  @override
  Future<List<CartModel>> getUserCart() async {
    List<CartModel> cartlist = [];

    final response = await httpClient.post(Endpoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for(var ele in (response.data['data']['user_cart'])){
      cartlist.add(ele);
    }
   
    return cartlist;
  }

  @override
  Future<void> removeFromCart({required int productId}) async {
    await httpClient
        .post(Endpoints.removeFromCart, data: {'product_id': productId}).then(
            (value) =>
                HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0));
  }
}
