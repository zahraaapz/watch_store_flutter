class Banner {
  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Banner({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['created_at'] =createdAt.toIso8601String();
    data['updated_at'] =updatedAt.toIso8601String();
    return data;
  }
}