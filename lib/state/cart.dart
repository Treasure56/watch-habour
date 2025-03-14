import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_habour/functions/functions.dart';
import 'package:watch_habour/models/cart_item.dart';
import 'package:watch_habour/models/product.dart';

class CartState {
  static final items = StateProvider<List<CartItemModel>>((ref) => []);

  static void addItem(WidgetRef ref, ProductModel product) {
    final items = ref.read(CartState.items);
    bool inCart = items.any((item) => item.productId == product.image);

    if (inCart) {
      final item = items.firstWhere((item) => item.productId == product.image);
      item.incrementCount();
      items.removeWhere((item) => item.productId == product.image);
      items.add(item);
    } else {
      items.add(CartItemModel(productId: product.image, count: 1));
    }
    AppToast.showSuccess("${product.title} added to cart");
  }

  static void removeItem(WidgetRef ref, ProductModel product) {
    final items = ref.read(CartState.items);
    bool inCart = items.any((item) => item.productId == product.image);

    if (inCart) {
      final item = items.firstWhere((item) => item.productId == product.image);
      item.decrementCount();
      items.removeWhere((item) => item.productId == product.image);
      if (item.count > 0) items.add(item);
    }
    AppToast.showSuccess("${product.title} removed from cart");
  }

  static void deleteItem(WidgetRef ref, ProductModel product) {
    final items = ref.read(CartState.items);
    bool inCart = items.any((item) => item.productId == product.image);

    if (inCart) {
      items.removeWhere((item) => item.productId == product.image);
    }
    AppToast.showSuccess("${product.title} deleted from cart");
  }
}
