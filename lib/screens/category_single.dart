import 'package:flutter/material.dart';
import 'package:watch_habour/api/api.dart';
import 'package:watch_habour/models/category.dart';
import 'package:watch_habour/models/product.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/product_card.dart';
import 'package:watch_habour/widgets/widgets.dart';

class CategorySingleScreen extends StatefulWidget {
  const CategorySingleScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  State<CategorySingleScreen> createState() => _CategorySingleScreenState();
}

class _CategorySingleScreenState extends State<CategorySingleScreen> {
  List<ProductModel> products = [];

  @override
  void initState() {
    products = Api.getCategoryProducts(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.category.title,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: size * 3
        ),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20,
            spacing: 10,
            // runAlignment: WrapAlignment.spaceEvenly,
            alignment: WrapAlignment.start,
            children: [...products.map((prod) => ProductCard(product: prod))],
          ),
        ),
      ),
    );
  }
}
