import 'package:apple_shop/screen/widget/banner_slider.dart';
import 'package:apple_shop/screen/widget/category_section.dart';
import 'package:apple_shop/screen/widget/product_items.dart';
import 'package:apple_shop/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final PageController pageController = PageController(
      viewportFraction: 0.8,
    );
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 46,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    Image.asset('assets/img/icon_search.png'),
                    Expanded(
                      child: TextField(
                        style: themeData.textTheme.bodyMedium,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'جستجوی محصولات',
                        ),
                      ),
                    ),
                    Image.asset('assets/img/icon_apple_blue.png'),
                  ],
                ),
              ),
              BannerSlider(pageController: pageController),
              Text(
                'دسته بندی',
                textAlign: TextAlign.start,
                style: themeData.textTheme.bodyMedium!.copyWith(
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CategorySection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'پرفروش ترین ها',
                    textAlign: TextAlign.start,
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: AppColor.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'مشاهده همه',
                          style: themeData.textTheme.bodyMedium!.copyWith(
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/img/icon_left_categroy.png',
                      ),
                    ],
                  )
                ],
              ),
              ProductItems(themeData: themeData),
            ],
          ),
        ),
      ),
    ));
  }
}
