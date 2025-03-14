import 'dart:convert';

class CategoryModel {
  final int id;
  final String title;
  final String image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  // Factory method to create an instance from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "image": image,
    };
  }

  // Function to convert a JSON List to a List of CategoryModel objects
  static List<CategoryModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => CategoryModel.fromJson(item)).toList();
  }
}
