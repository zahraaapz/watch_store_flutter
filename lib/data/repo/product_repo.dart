import 'package:watch_store_flutter/data/model/product_detail.dart';

import '../model/product.dart';
import '../src/product_data_src.dart';
import 'package:dio/dio.dart';

abstract class IProductRepo {

  Future<List<Product>> getAllByCategory(int id);
  Future<ProductDetailes> getproductDetail(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);


}
final productRepository=ProductRepository(ProductRemoteDataSrc(Dio()));

class ProductRepository implements IProductRepo{

 final IProductDataSrc  iProductDataSrc;
 ProductRepository(this.iProductDataSrc);
  


  
  @override
  Future<List<Product>> getAllByBrand(int id) => iProductDataSrc.getAllByBrand(id);
  
  @override
  Future<List<Product>> getAllByCategory(int id) => iProductDataSrc.getAllByCategory(id);
  
  @override
  Future<List<Product>> getSorted(String routeParam) =>iProductDataSrc.getSorted(routeParam);
  
  @override
  Future<List<Product>> searchProducts(String searchKey)=>iProductDataSrc.searchProducts(searchKey);
  
  @override
  Future<ProductDetailes> getproductDetail(int id)=>iProductDataSrc.getproductDetail(id);



}