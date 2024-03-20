class CartModel {
  int id;
  int productId;
  bool countLoading;
  bool deleteLoading;
  String product;
  int count;
final image;
final price;
  CartModel(
      {required this.id,
      required this.productId,
      required this.image,
      required this.price,
      required this.product,
      this.countLoading=false,
      this.deleteLoading=false,
      required this.count});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      image: json['image'],
      price: json['price'],
      productId: json['product_id'],
      product: json['product'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product'] = product;
    data['count'] = count;
    return data;
  }
}