import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_flutter/data/src/constant.dart';
import '../../utils/response_validator.dart';
import '../model/product.dart';


abstract class ProductDataSrc {
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements ProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<Product>> getAllByBrand(int id) async {
    List<Product> products = <Product>[];

    final response =
        await httpClient.get(Endpoints.productsByBrand + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<Product>> getAllByCategory(int id) async {
    List<Product> products = <Product>[];

    final response =
        await httpClient.get(Endpoints.productsByCategory + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<Product>> getSorted(String routeParam) async {
    List<Product> products = <Product>[];

    final response = await httpClient.get(Endpoints.baseUrl + routeParam);
    debugPrint(response.statusCode.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    debugPrint(response.data.toString());
    for (var elemnt in response.data['all_products']['data'] as List) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProducts(String searchKey) async {
    List<Product> products = <Product>[];

    final response = await httpClient.get(Endpoints.baseUrl + searchKey);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }

    return products;
  }
}