import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_hub/api/api.dart';
import 'package:watch_hub/functions/functions.dart';
import 'package:watch_hub/models/cart_item.dart';
import 'package:watch_hub/models/product.dart';
import 'package:watch_hub/screens/product_single.dart';
import 'package:watch_hub/state/cart.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class CartProductCard extends ConsumerStatefulWidget {
  const CartProductCard(
      {super.key, required this.product, required this.onDelete});

  final CartItemModel product;
  final Function() onDelete;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartProductCardState();
}

class _CartProductCardState extends ConsumerState<CartProductCard> {
  late ProductModel product;

  @override
  void initState() {
    product = Api.getItemById(widget.product.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size * 2),
      // width: AppDimensions.vw(context, 42),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () => to(context, ProductSingleScreen(product)),
          child: Container(
            width: size * 12,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: CachedNetworkImage(
                imageUrl: product.image,
                // height: 200,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        const SizedBox(width: size),
        Expanded(
          child: GestureDetector(
            onTap: () => to(context, ProductSingleScreen(product)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.small(product.title),
                AppText.small(
                  Money.format(product.price),
                  weight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.lightGrey,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                CartState.removeItem(ref, product);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove_rounded,
                              )),
                          AppText.small(widget.product.count.toString()),
                          IconButton(
                              onPressed: () {
                                CartState.addItem(ref, product);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add_rounded,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 90,
                      child: AppButton.gradient(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          CartState.deleteItem(ref, product);
                          widget.onDelete();
                          setState(() {});
                        },
                        child: "remove",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
