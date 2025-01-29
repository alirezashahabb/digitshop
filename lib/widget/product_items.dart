import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 10,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Assets.img.iphone.image(),
              Positioned(
                top: 0,
                right: -28,
                child: Assets.img.activeFavProduct.image(),
              ),
              Positioned(
                bottom: -10,
                left: -33,
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 15,
                  decoration: BoxDecoration(
                    color: AppColor.redColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('20%',
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: AppColor.whiteColor,
                        fontSize: 12,
                      )),
                ),
              )
            ],
          ),
          Text(
            'آیفون 13 پرومکس',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Spacer(),
          Container(
            height: 53,
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.mainColor,
                  blurRadius: 25,
                  spreadRadius: -12,
                  offset: Offset(0, 15),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.img.iconRightArrowCricle.image(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '49000000'.seRagham(),
                        style: themeData.textTheme.bodyMedium!.copyWith(
                            color: AppColor.whiteColor,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColor.whiteColor,
                            fontSize: 12),
                      ),
                      Text(
                        '45000000'.seRagham(),
                        style: themeData.textTheme.bodyMedium!.copyWith(
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    'تومان',
                    style: themeData.textTheme.bodyMedium!.copyWith(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
