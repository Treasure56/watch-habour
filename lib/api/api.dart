import 'package:watch_habour/data/categories.dart';
import 'package:watch_habour/data/products.dart';
import 'package:watch_habour/models/category.dart';
import 'package:watch_habour/models/product.dart';

class Api {
  static List<CategoryModel> getAllCategories() {
    return CategoryModel.fromJsonList(categoriesData);
  }

  static List<ProductModel> getAllProducts() {
    return ProductModel.fromJsonList(productsData);
  }

  static List<ProductModel> searchProducts(String keyword) {
    return ProductModel.fromJsonList(productsData).where((item) {
      return item.title.toLowerCase().contains(keyword.toLowerCase()) ||
          item.brand.toLowerCase().contains(keyword.toLowerCase()) ||
          item.description.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

  static List<ProductModel> getCategoryProducts(CategoryModel category) {
    return ProductModel.fromJsonList(productsData).where((item) {
      return item.categoryId == category.id;
    }).toList();
  }

  static List<ProductModel> getSimilarProducts(ProductModel product) {
    return getAllProducts()
        .where((item) =>
            item.categoryId == product.categoryId &&
            item.image != product.image)
        .toList();
  }

  static ProductModel getItemById(String id) {
    return getAllProducts().firstWhere((item) => item.image == id);
  }
}
