class CartItemModel {
  final String productId;
  int count;

  CartItemModel({required this.productId, required this.count});

  // Convert JSON to CartItemModel
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      count: json['count'],
    );
  }

  // Convert CartItemModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'count': count,
    };
  }

  // Copy with method (useful for updating cart items)
  CartItemModel copyWith({String? productId, int? count}) {
    return CartItemModel(
      productId: productId ?? this.productId,
      count: count ?? this.count,
    );
  }

  void incrementCount() {
    count = count + 1;
  }

  void decrementCount() {
    count = count - 1;
  }

  @override
  String toString() => 'CartItemModel(productId: $productId, count: $count)';
}
