import 'dart:convert';

class ProductModel {
  final String title;
  final String brand;
  final String description;
  final int categoryId;
  final double price;
  final int stock;
  final String image;

  ProductModel({
    required this.title,
    required this.brand,
    required this.description,
    required this.categoryId,
    required this.price,
    required this.stock,
    required this.image,
  });

  // Factory method to create an instance from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      brand: (json['brand'] == null) ? "" : json['brand'],
      description: json['description'],
      categoryId: json['categoryId'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      image: json['image'],
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "brand": brand,
      "description": description,
      "categoryId": categoryId,
      "price": price,
      "stock": stock,
      "image": image,
    };
  }

  // Convert JSON List to ProductModel List
  static List<ProductModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => ProductModel.fromJson(item)).toList();
  }
}
