import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/utils/response_validator.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();
  Future<List<CartModel>> addToCart({required int productId});
  Future<List<CartModel>> removeFromCart({required int productId});
  Future<List<CartModel>> deleteFromCart({required int productId});
  Future<int> countCartItem();

}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<List<CartModel>> addToCart({required int productId}) async {
  List<CartModel> cartlist = [];


    final response = await httpClient.post(Endpoints.addToCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var ele in (response.data['data']['user_cart'])) {
      cartlist.add(ele);
    }

    return cartlist;

  }

  

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) async{
  List<CartModel> cartlist = [];


    final response = await httpClient.post(Endpoints.deleteFromCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var ele in (response.data['data']['user_cart'])) {
      cartlist.add(ele);
    }

    return cartlist;

  }

  @override
  Future<List<CartModel>> getUserCart() async {
    List<CartModel> cartlist = [];

    final response = await httpClient.post(Endpoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var ele in (response.data['data']['user_cart'])) {
      cartlist.add(ele);
    }

    return cartlist;
  }

  @override
  Future<List<CartModel>> removeFromCart({required int productId}) async {
  List<CartModel> cartlist = [];


    final response = await httpClient.post(Endpoints.removeFromCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var ele in (response.data['data']['user_cart'])) {
      cartlist.add(ele);
    }

    return cartlist;

  }

   
  
  @override
  Future<int> countCartItem() async{
final res=await httpClient.post(Endpoints.userCart);
 HTTPResponseValidator.isValidStatusCode(res.statusCode ?? 0);
return (res.data['data']['user_cart'] as List).length;
  }
}
