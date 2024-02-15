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
        id: elemnt['id'], title: elemnt['title'], image: elemnt['image']);
  }


Map<String,dynamic> toJson(){
  final Map<String,dynamic> data=<String,dynamic>{};

  data['id']=id;
  data['image']=image;
  data['title']=title;

  return data;
}



}
