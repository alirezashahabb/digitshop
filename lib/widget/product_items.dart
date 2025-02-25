import 'package:apple_shop/bloc/cart/cart_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/screen/single_product_screen.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:apple_shop/utils/image_loading_service.dart';
import 'package:apple_shop/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductItems extends StatelessWidget {
  final ProductModel product;
  const ProductItems({
    super.key,
    required this.themeData,
    required this.product,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goScreen(
          context: context,
          screen: BlocProvider<CartBloc>.value(
            value: locator.get<CartBloc>(),
            child: SingleProductScreen(
              singleProduct: product,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: 160,
        height: 220,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          spacing: 12,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: ImageLoadingService(mainImage: product.thumbnail!)),
                Positioned(
                  top: 0,
                  right: -24,
                  child: Assets.img.activeFavProduct.image(),
                ),
                Positioned(
                  bottom: -10,
                  left: -28,
                  child: Container(
                    alignment: Alignment.center,
                    width: 36,
                    height: 15,
                    decoration: BoxDecoration(
                      color: AppColor.redColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('${product.persent!.round().toString()}%',
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: AppColor.whiteColor,
                          fontSize: 12,
                        )),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  product.name!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                ),
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
                          '${product.price}'.seRagham(),
                          style: themeData.textTheme.bodyMedium!.copyWith(
                              color: AppColor.whiteColor,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColor.whiteColor,
                              fontSize: 12),
                        ),
                        Text(
                          '${product.realPeice}'.seRagham(),
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
      ),
    );
  }
}
