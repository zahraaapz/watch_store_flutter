import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/data/model/cart.dart';
import 'package:watch_store_flutter/utils/response_validator.dart';


abstract class ICartDataSrc {
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> countCartItem();
  Future<String> payCart();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<UserCart> addToCart({required int productId}) async {
    

    final response = await httpClient
        .post(Endpoints.addToCart, data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<UserCart> deleteFromCart({required int productId}) async {


    final response = await httpClient
        .post(Endpoints.deleteFromCart, data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);


    return  UserCart.fromJson(response.data['data']);

  }

  @override
  Future<UserCart> getUserCart() async {


    final response = await httpClient.post(Endpoints.userCart);

    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

   return UserCart.fromJson(response.data['data']);

  }

  @override
  Future<UserCart> removeFromCart({required int productId}) async {


    final response = await httpClient
        .post(Endpoints.removeFromCart, data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);


   
  }

  @override
  Future<int> countCartItem() async {
    final res = await httpClient.post(Endpoints.userCart);
    HTTPResponseValidator.isValidStatusCode(res.statusCode ?? 0);
    return (res.data['data']['user_cart'] as List).length;
  }


  
  @override
  Future<String> payCart()async {
 final res=await httpClient.post(Endpoints.payment);
 HTTPResponseValidator.isValidStatusCode(res.statusCode ?? 0);

 return res.data['action'];
  }
}
