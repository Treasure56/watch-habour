import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watch_habour/api/api.dart';
import 'package:watch_habour/functions/functions.dart';
import 'package:watch_habour/models/product.dart';
import 'package:watch_habour/state/cart.dart';
import 'package:watch_habour/state/wishlist.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/product_card.dart';
import 'package:watch_habour/widgets/widgets.dart';

class ProductSingleScreen extends ConsumerStatefulWidget {
  const ProductSingleScreen(this.product, {super.key});

  final ProductModel product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductSingleScreenState();
}

class _ProductSingleScreenState extends ConsumerState<ProductSingleScreen> {
  List<ProductModel> similarProducts = [];
  @override
  void initState() {
    similarProducts = Api.getSimilarProducts(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool inWishlist = ref
        .watch(WishlistState.items)
        .any((i) => i.image == widget.product.image);

    return AppScaffold(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: size, vertical: size * 0.4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AppText.small(
              "watch by ${widget.product.brand}",
              color: AppColors.white,
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size * 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AspectRatio(
                    aspectRatio: 4 / 4.2,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: widget.product.image,
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        width: double.maxFinite,
                        // height: 200,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppText.big(widget.product.title),
                const SizedBox(height: 20),
                AppText.small(widget.product.description, color: Colors.black54,),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: AppButton.primary(
                        onPressed: () {
                          CartState.addItem(ref, widget.product);
                        },
                        iconBefore: true,
                        icon: FontAwesomeIcons.bagShopping,
                        child: "Add to cart",
                      ),
                    ),
                    AppText.medium(Money.format(widget.product.price)),
                  ],
                ),
                const SizedBox(height: 40),
                const AppText.small(
                  "Watches you may like",
                  weight: FontWeight.w500,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  // height: 200,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...similarProducts.map((prod) => Padding(
                              padding: const EdgeInsets.only(right: size),
                              child: ProductCard(product: prod),
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
