class Slide {
  int id;
  String image;
  String title;

  Slide({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Slide.fromJson(Map<String, dynamic> elemnt) {
    return Slide(
        id: elemnt['id'] as int,
        title: elemnt['title'] as String,
        image: elemnt['image'] as String);
  }
}
