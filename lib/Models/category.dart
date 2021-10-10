class Category {
  String categoryName;
  String imgUrl;

  Category({required this.categoryName, required this.imgUrl});

  factory Category.fromJson(Map<String, dynamic> jsonMap) {
    return Category(
        categoryName: jsonMap["jsonMap"], imgUrl: jsonMap["jsonMap"]);
  }
}
