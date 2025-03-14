import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_hub/functions/functions.dart';
import 'package:watch_hub/models/product.dart';
import 'package:watch_hub/state/wishlist.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/cards/wishlist_product_card.dart';
import 'package:watch_hub/widgets/widgets.dart';

class WishlistPage extends ConsumerStatefulWidget {
  const WishlistPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistPageState();
}

class _WishlistPageState extends ConsumerState<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = ref.watch(WishlistState.items);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size * 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const AppText.medium("My Wishlist"),
            const SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                if (products.isEmpty)
                  const AppText.big("Wishlist is Empty", weight: FontWeight.w300,)
                else
                ...products.map((prod) => WishlistProductCard(product: prod))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
