import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/image_loading_service.dart';
import 'package:apple_shop/utils/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(
      CategoryInitEvent(),
    );
    super.initState();
  }

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
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitState) {
                return SliverToBoxAdapter(
                  child: LoadingAnimation(),
                );
              } else if (state is CategoryRepoanseState) {
                return state.items.fold(
                  (error) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                  (response) {
                    return CategoryList(
                      items: response,
                    );
                  },
                );
              }
              return SliverToBoxAdapter(
                child: Text('Erro'),
              );
            },
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<CategoryItemsModel> items;
  const CategoryList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: items.length,
          (context, index) {
            var mainItems = items[index];
            return ImageLoadingService(mainImage: mainItems.thumbnail!);
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
