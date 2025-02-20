import 'package:apple_shop/bloc/bloc/prodoct_list_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/widget/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  final CategoryItemsModel categoryItemsModel;

  const ProductListScreen({super.key, required this.categoryItemsModel});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<ProdoctListBloc>(context).add(
      ProductListInitEvent(categortId: widget.categoryItemsModel.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<ProdoctListBloc, ProdoctListState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is ProdoctListLoadingState) ...{
                SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              } else ...{
                if (state is ProdoctListSucessState) ...{
                  SliverAppBar(
                    actions: [
                      Assets.img.iconAppleBlue.image(),
                    ],
                    centerTitle: true,
                    title: Text(
                      widget.categoryItemsModel.title!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColor.mainColor,
                            fontSize: 17,
                          ),
                    ),
                    leading: Assets.img.iconBack.image(),
                  ),
                },
                if (state is ProdoctListSucessState) ...{
                  state.productList.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (response) {
                    return SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 44, vertical: 30),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          var items = response[index];
                          return ProductItems(
                            product: items,
                            themeData: themeData,
                          );
                        }, childCount: response.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3.2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                        ),
                      ),
                    );
                  })
                }
              },

              //==========================================>>>> Products Items
            ],
          );
        },
      ),
    );
  }
}
