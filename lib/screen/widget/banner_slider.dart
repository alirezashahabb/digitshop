import 'package:apple_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        padEnds: false,
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                height: 200,
                color: Colors.red,
              ),
              Positioned(
                bottom: 25,
                child: SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 5,
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
