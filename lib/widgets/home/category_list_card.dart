import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watch_habour/models/category.dart';
import 'package:watch_habour/screens/category_single.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => to(context, CategorySingleScreen(category: category)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: size),
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.only(bottom: size),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 3),
            color: AppColors.white,
            border: Border.all(color: AppColors.white, width: 2)),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: category.image,
              height: size * 14,
              width: size * 14,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: size),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText.small(
                category.title,
                size: size * 1.6,
                weight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
