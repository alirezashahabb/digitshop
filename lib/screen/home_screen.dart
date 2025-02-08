import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/model/product_model.dart';
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
              } else ...{
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
                  }),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        'دسته بندی',
                        textAlign: TextAlign.start,
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  state.category.fold((error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  }, (response) {
                    return GetCategory(categories: response);
                  }),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'پر بازدید ترین ها',
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
                                  style:
                                      themeData.textTheme.bodyMedium!.copyWith(
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
                  ),
                  state.hottestProduct.fold((error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  }, (response) {
                    return SliverToBoxAdapter(
                      child: ProductBestSellerList(
                        productItems: response,
                        themeData: themeData,
                      ),
                    );
                  }),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'پر فروش ترین ها',
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
                                  style:
                                      themeData.textTheme.bodyMedium!.copyWith(
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
                  ),
                  state.bsetSellerProducts.fold((error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  }, (response) {
                    return SliverToBoxAdapter(
                      child: ProductBestSellerList(
                        productItems: response,
                        themeData: themeData,
                      ),
                    );
                  }),
                },
              },
            ],
          );
        },
      ),
    );
  }
}

// ===========================================>>>>>>>>>>>ProductBestSellerList
class ProductBestSellerList extends StatelessWidget {
  const ProductBestSellerList({
    super.key,
    required this.themeData,
    required this.productItems,
  });

  final ThemeData themeData;
  final List<ProductModel> productItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ProductItems(
              themeData: themeData,
              product: productItems[index],
            ),
          );
        },
      ),
    );
  }
}

class GetCategory extends StatelessWidget {
  final List<CategoryItemsModel> categories;
  const GetCategory({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategorySection(
        categories: categories,
      ),
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
