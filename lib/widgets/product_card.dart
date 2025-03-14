import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watch_hub/functions/functions.dart';
import 'package:watch_hub/models/product.dart';
import 'package:watch_hub/screens/product_single.dart';
import 'package:watch_hub/state/wishlist.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/widgets.dart';

class ProductCard extends ConsumerStatefulWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool inWishlist = ref
        .watch(WishlistState.items)
        .any((i) => i.image == widget.product.image);

    return Container(
      // padding: ,
      width: AppDimensions.vw(context, 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => to(context, ProductSingleScreen(widget.product)),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CachedNetworkImage(
                  imageUrl: widget.product.image,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  // height: 200,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(height: size),
          GestureDetector(
              onTap: () => to(context, ProductSingleScreen(widget.product)),
              child: AppText.small(widget.product.title)),
          const SizedBox(height: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.small(
                Money.format(widget.product.price),
                weight: FontWeight.w600,
                color: AppColors.primary,
              ),
              SizedBox(
                width: 40,
                child: MaterialButton(
                  // height: 40,
                  padding: const EdgeInsets.all(size),
                  onPressed: () {
                    if (inWishlist) {
                      ref
                          .read(WishlistState.items)
                          .removeWhere((i) => i.image == widget.product.image);
                      AppToast.showSuccess(
                          "${widget.product.title} removed from wishlist");
                    } else {
                      ref.read(WishlistState.items).add(widget.product);
                      AppToast.showSuccess(
                          "${widget.product.title} added to wishlist");
                    }
                    setState(() {});
                  },
                  child: Icon(
                    inWishlist
                        ? FontAwesomeIcons.heartCircleBolt
                        : FontAwesomeIcons.heart,
                    size: size * 2,
                    color: inWishlist ? Colors.red : Colors.black87,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
