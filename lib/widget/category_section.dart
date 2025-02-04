import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/widget/categroy_items.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryItemsModel> categories;
  const CategorySection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: CategoryItems(
              categoryItems: categories[index],
            ),
          );
        },
      ),
    );
  }
}
