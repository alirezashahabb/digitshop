import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/colo_extion.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          backgroundColor: AppColor.greenColor,
          onPressed: () {},
          label: Text('ادامه به سبد خرید',
              style: themeData.textTheme.bodyMedium!.copyWith(
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Assets.img.iconAppleBlue.image(),
            ],
            centerTitle: true,
            title: Text(
              'سبد خرید',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColor.mainColor,
                    fontSize: 17,
                  ),
            ),
            leading: Assets.img.iconBack.image(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return CartItem(themeData: themeData);
          }, childCount: 10))
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(44, 10, 44, 20),
      height: 249,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whiteColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Assets.img.iphone.image(),
                  Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'آیفون13 پرو مکس',
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'گارانتی فیلان 18 ماهه',
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: AppColor.secondaryColor,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('244تومان'),
                          Container(
                            alignment: Alignment.center,
                            width: 36,
                            height: 15,
                            decoration: BoxDecoration(
                              color: AppColor.redColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text('5%',
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: AppColor.whiteColor,
                                  fontSize: 12,
                                )),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          OptionCheap(
                            'test',
                            color: 'eeeeee',
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.redColor,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 6,
                              ),
                              child: Row(
                                spacing: 4,
                                children: [
                                  Assets.img.iconTrash.image(),
                                  Text('حذف'),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: DottedLine(
              lineThickness: 3,
              dashLength: 8,
              dashColor: AppColor.secondaryColor.withOpacity(0.5),
              dashGapLength: 3,
              dashGapColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text('900000 تومان'),
          )
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  String title;
  String? color;
  OptionCheap(this.title, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 6,
        ),
        child: Row(
          spacing: 4,
          children: [
            Text(title),
            if (color != null) ...{
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color!.colorParsing(),
                  shape: BoxShape.circle,
                ),
              )
            },
          ],
        ),
      ),
    );
  }
}
