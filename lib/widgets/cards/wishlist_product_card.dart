import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_hub/functions/functions.dart';
import 'package:watch_hub/models/product.dart';
import 'package:watch_hub/screens/product_single.dart';
import 'package:watch_hub/state/wishlist.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class WishlistProductCard extends ConsumerStatefulWidget {
  const WishlistProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WishlistProductCardState();
}

class _WishlistProductCardState extends ConsumerState<WishlistProductCard> {
  @override
  Widget build(BuildContext context) {
    bool inWishlist = ref
        .watch(WishlistState.items)
        .any((i) => i.image == widget.product.image);

    if (!inWishlist) return const SizedBox();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size),
      // width: AppDimensions.vw(context, 42),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () => to(context, ProductSingleScreen(widget.product)),
          child: Container(
            width: size * 10,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: CachedNetworkImage(
                imageUrl: widget.product.image,
                // height: 200,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        const SizedBox(width: size),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => to(context, ProductSingleScreen(widget.product)),
                child: AppText.small(widget.product.title),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.small(
                    Money.format(widget.product.price),
                    weight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    height: 30,
                    width: 90,
                    child: AppButton.gradient(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        ref.read(WishlistState.items).removeWhere(
                            (i) => i.image == widget.product.image);
                        AppToast.showSuccess(
                            "${widget.product.title} removed from wishlist");
                        setState(() {});
                      },
                      child: "remove -",
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
