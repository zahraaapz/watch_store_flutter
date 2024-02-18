class Categories {
  int id;
  String image;
  String title;

  Categories({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Categories.fromJson(Map<String, dynamic> elemnt) {
    return Categories(
        id: elemnt['id'] as int,
        title: elemnt['title'] as String,
        image: elemnt['image'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['image'] = image;
    data['title'] = title;

    return data;
  }
}
