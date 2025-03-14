import 'package:flutter/material.dart';
import 'package:watch_hub/api/api.dart';
import 'package:watch_hub/models/product.dart';
import 'package:watch_hub/screens/search.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/home/category_list.dart';
import 'package:watch_hub/widgets/product_card.dart';
import 'package:watch_hub/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> products = Api.getAllProducts();
  final _textEditingController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: size * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const AppText.medium("WatchHub"),
          const SizedBox(height: 12),
          AppTextField(
            controller: _textEditingController,
            hintText: "Search for watches",
            onEditingComplete: () => {
              to(context, SearchScreen(keyword: _textEditingController.text))
            },
          ),
          const SizedBox(height: 12),
          Expanded(
              child: ListView(
            children: [
              const HomePageCategoryList(),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    AppText.small("Watches For You", weight: FontWeight.w500),
              ),
              const SizedBox(height: size * .5),
              Wrap(
                runSpacing: 20,
                // runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.spaceAround,
                children: [
                  ...products.map((prod) => ProductCard(product: prod))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
