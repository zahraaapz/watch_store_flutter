import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/conf/remote_conf.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/data/repo/product_repo.dart';
import 'package:watch_store_flutter/data/src/product_data_src.dart';

class ProductRepoTest{
  final product=ProductRepository(ProductRemoteDataSrc(DioManager.dio));
  getProduct() async=> await product.getSorted(ProductSortRoutes.newestProducts);
}