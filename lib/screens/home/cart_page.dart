import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_hub/models/cart_item.dart';
import 'package:watch_hub/screens/checkout.dart';
import 'package:watch_hub/state/cart.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/cart_product_card.dart';
import 'package:watch_hub/widgets/widgets.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<CartItemModel> products = ref.watch(CartState.items);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size * 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.medium("My Cart"),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: AppButton.primary(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      to(context, const CheckoutScreen());
                    },
                    child: "Check Out",
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                if (products.isEmpty)
                  const AppText.big(
                    "Cart is Empty",
                    weight: FontWeight.w300,
                  )
                else
                  ...products.map((prod) => CartProductCard(
                      product: prod, onDelete: () => setState(() {})))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
