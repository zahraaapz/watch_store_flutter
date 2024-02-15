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
        id: elemnt['id'], title: elemnt['title'], image: elemnt['image']);
  }
}
