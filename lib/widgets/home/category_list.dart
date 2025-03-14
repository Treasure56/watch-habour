import 'package:flutter/material.dart';
import 'package:watch_habour/api/api.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/home/category_list_card.dart';
import 'package:watch_habour/widgets/widgets.dart';

class HomePageCategoryList extends StatefulWidget {
  const HomePageCategoryList({super.key});

  @override
  State<HomePageCategoryList> createState() => _HomePageCategoryListState();
}

class _HomePageCategoryListState extends State<HomePageCategoryList> {
  List categories = Api.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText.small("Categories", weight: FontWeight.w500),
        const SizedBox(height: size * .5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...categories.map((cat) => CategoryListCard(category: cat))
            ],
          ),
        ),
      ],
    );
  }
}
