import 'package:flutter/material.dart';
import 'package:watch_hub/api/api.dart';
import 'package:watch_hub/models/category.dart';
import 'package:watch_hub/models/product.dart';
import 'package:watch_hub/utils/utils.dart';
import 'package:watch_hub/widgets/product_card.dart';
import 'package:watch_hub/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.keyword});
  final String keyword;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductModel> products = [];
  final _textEditingController = TextEditingController(text: "");

  @override
  void initState() {
    _textEditingController.text = widget.keyword;
    products = Api.searchProducts(widget.keyword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Search",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size * 3),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: _textEditingController,
                hintText: "Search for products",
                onEditingComplete: () => {
                  backTo(context,
                      SearchScreen(keyword: _textEditingController.text))
                },
              ),
              const SizedBox(height: 20),
              if (products.isEmpty)
                AppText.medium(
                    "No results found for \"${_textEditingController.text}\"")
              else
                Wrap(
                  runSpacing: 20,
                  spacing: 10,
                  // runAlignment: WrapAlignment.spaceEvenly,
                  alignment: WrapAlignment.start,
                  children: [
                    ...products.map((prod) => ProductCard(product: prod))
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
