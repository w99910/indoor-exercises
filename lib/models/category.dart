import 'dart:ui';

class Category {
  String categoryName;
  String categoryImage;
  Color? color;
  Category({required this.categoryName, required this.categoryImage,this.color});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(categoryName: json['name'], categoryImage: json['image'],color: Color(int.parse(json['color'])));
  }

  Map<String, dynamic> toJson() {
    return {
      "name": categoryName,
      "image": categoryImage,
    };
  } 
}
