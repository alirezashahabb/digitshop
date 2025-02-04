import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/image_loading_service.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerModel> banner;
  const BannerSlider({
    super.key,
    required this.pageController,
    required this.banner,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        padEnds: false,
        controller: pageController,
        itemCount: banner.length,
        itemBuilder: (context, index) {
          var items = banner[index];
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 20),
                height: 200,
                child: ImageLoadingService(
                  radius: 15,
                  mainImage: items.thumbnail!,
                ),
              ),
              Positioned(
                bottom: 25,
                child: SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: banner.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 3,
                    activeDotColor: AppColor.mainColor,
                    dotHeight: 5,
                    dotWidth: 8,
                    dotColor: AppColor.scaffoldColor,
                  ), // your preferred effect
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
