import 'package:watch_store_flutter/data/model/banner.dart';
import 'package:watch_store_flutter/data/model/categories.dart';

import 'product.dart';
import 'slide.dart';

class Home {
  List<Slide> sliders;
  List<Categories> categories;
  List<Product> amazingProducts;
  List<Product> mostSellerProducts;
  List<Product> newestProducts;
  Banner banner;

  Home({
    required this.sliders,
    required this.categories,
    required this.amazingProducts,
    required this.mostSellerProducts,
    required this.newestProducts,
    required this.banner,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
        sliders:
            (json['sliders'] as List<dynamic>).map((e) => Slide.fromJson(e)).toList(),
        categories: (json['categories'] as List<dynamic>)
            .map((e) => Categories.fromJson(e))
            .toList(),
        amazingProducts: (json['amazing_products'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList(),
        mostSellerProducts: (json['most_seller_products'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList(),
        newestProducts: (json['newest_products'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList(),
        banner: Banner.fromJson(json['banner']));
  }
}
