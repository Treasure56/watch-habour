import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_hub/models/product.dart';

class WishlistState {
  static final items = StateProvider<List<ProductModel>>((ref) => []);
}
