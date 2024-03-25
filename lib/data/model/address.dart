class Addres {
  String address;
  double lat;
  double lng;
  String postalCode;

  Addres({
    required this.address,
    required this.lat,
    required this.lng,
    required this.postalCode,
  });



  factory Addres.fromJson(Map<String, dynamic> json) {
    return Addres(
      address: json['address'],
      lat: json['lat'],
      lng: json['lng'],
      postalCode: json['postal_code'],
    );
  }
}