import 'dart:convert';

class User {
  String name;
  String phone;
  String address;
  String postalCode;
  final image;
  final double lat;
  final double lng;

  User({
    required this.name,
    required this.phone,
    required this.postalCode,
    required this.address,
    required this.image,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'image': image,
      'postal_code': postalCode,
      'lat': lat,
      'lng': lng
    };
  }

  factory User.fromJson(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);

    return User(
        name: map['name'],
        phone: map["phone"],
        postalCode: map['postal_code'],
        address: map['address'],
        image: map['image'],
        lat: map['lat'],
        lng: map['lng']);
  }
}
