import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/utils/image_loading_service.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final CategoryItemsModel categoryItems;
  const CategoryItems({
    super.key,
    required this.categoryItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              color: categoryItems.getColor(),
              shadows: [
                BoxShadow(
                  color: categoryItems.getColor(),
                  blurRadius: 20,
                  spreadRadius: -6,
                  offset: Offset(
                    0,
                    12,
                  ),
                ),
              ],
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ImageLoadingService(
                  mainImage: categoryItems.icon!,
                ),
              ),
            )),
        Text(
          categoryItems.title!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
