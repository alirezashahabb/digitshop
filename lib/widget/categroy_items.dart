import 'package:apple_shop/theme.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
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
            color: Colors.red,
            shadows: [
              BoxShadow(
                color: Colors.red,
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
          child: Icon(
            Icons.card_giftcard,
            color: AppColor.whiteColor,
            size: 30,
          ),
        ),
        Text('همه')
      ],
    );
  }
}
