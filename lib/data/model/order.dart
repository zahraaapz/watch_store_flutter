class OrderDetail {
  int id;
  String product;
  String productId;
  int count;
  int price;
  int discountPrice;
  final image;

  OrderDetail({
    required this.id,
    required this.product,
    required this.productId,
    required this.count,
    required this.price,
    required this.discountPrice,
    required this.image,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      product: json['product'],
      productId: json['product_id'],
      count: json['count'],
      price: json['price'],
      discountPrice: json['discount_price'],
      image: json['image'],
    );
  }
}

