import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/theme.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Assets.img.iconAppleBlue.image(),
            ],
            centerTitle: true,
            title: Text(
              'دسته بندی',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColor.mainColor,
                    fontSize: 17,
                  ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
