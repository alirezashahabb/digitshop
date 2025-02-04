import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/widget/banner_slider.dart';
import 'package:apple_shop/widget/category_section.dart';
import 'package:apple_shop/widget/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeInitEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final PageController pageController = PageController(
      viewportFraction: 0.8,
    );
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is HomeLoadingState) ...{
                SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              },
              GetSearchBox(themeData: themeData),
              if (state is HomeSuccesState) ...{
                state.banner.fold((error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                }, (response) {
                  return GetBanner(
                    pageController: pageController,
                    banner: response,
                  );
                })
              },
              SliverToBoxAdapter(
                child: Text(
                  'دسته بندی',
                  textAlign: TextAlign.start,
                  style: themeData.textTheme.bodyMedium!.copyWith(
                    color: AppColor.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GetCategory(),
              SliverToBoxAdapter(
                child: Row(
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
              ),
              SliverToBoxAdapter(
                child: ProductItems(themeData: themeData),
              )
            ],
          );
        },
      ),
    );
  }
}

class GetCategory extends StatelessWidget {
  const GetCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategorySection(),
    );
  }
}

//=============================================>>>>>Banner
class GetBanner extends StatelessWidget {
  final List<BannerModel> banner;
  const GetBanner({
    super.key,
    required this.pageController,
    required this.banner,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(
        pageController: pageController,
        banner: banner,
      ),
    );
  }
}

//====================================================>>>>SearchBox
class GetSearchBox extends StatelessWidget {
  const GetSearchBox({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Container(
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
                    hintText: 'جستجوی محصولات',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(17)),
                  )),
            ),
            Image.asset('assets/img/icon_apple_blue.png'),
          ],
        ),
      ),
    );
  }
}
