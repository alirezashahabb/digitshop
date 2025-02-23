import 'dart:ui';

import 'package:apple_shop/bloc/productSingle/productsingle_bloc.dart';
import 'package:apple_shop/gen/assets.gen.dart';
import 'package:apple_shop/model/gallery_model.dart';
import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/model/product_varaint_model.dart';
import 'package:apple_shop/model/propertis_model.dart';
import 'package:apple_shop/model/varaint_type_model.dart';
import 'package:apple_shop/model/varaints_model.dart';
import 'package:apple_shop/theme.dart';
import 'package:apple_shop/utils/image_loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class SingleProductScreen extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleProductScreen({super.key, required this.singleProduct});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsingleBloc>(context).add(
      ProductSingleInitEvent(
          id: widget.singleProduct.id!,
          categryId: widget.singleProduct.category!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsingleBloc, ProductsingleState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is ProductSingleLoadingStateate) ...{
                SliverToBoxAdapter(
                    child: Center(
                  child: CircularProgressIndicator(),
                ))
              } else ...{
                if (state is ProductSingleSuceesStateate) ...{
                  // ==========================AppBar title
                  state.category.fold(
                    (error) {
                      return SliverToBoxAdapter(
                        child: Text('دسته بندی'),
                      );
                    },
                    (response) {
                      return SliverAppBar(
                        actions: [
                          Assets.img.iconAppleBlue.image(),
                        ],
                        centerTitle: true,
                        title: Text(
                          response.title!,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColor.mainColor,
                                    fontSize: 17,
                                  ),
                        ),
                        leading: Assets.img.iconBack.image(),
                      );
                    },
                  ),
                  //=====================================>>>>ProductTitle
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 20),
                      child: Text(
                        widget.singleProduct.name!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  //==========================>>>>Gallaery
                  state.gallary.fold(
                    (erro) {
                      return SliverToBoxAdapter(
                        child: Text(erro),
                      );
                    },
                    (galley) {
                      return GallerySection(
                        gallery: galley,
                        defaultImage: widget.singleProduct.thumbnail!,
                      );
                    },
                  ),
                  state.productVaraint.fold((error) {
                    return SliverToBoxAdapter(
                      child: Text(error),
                    );
                  }, (varaint) {
                    return VaraintContinerGenerator(
                        productVaraintModel: varaint);
                  }),
                  //=================================>>>>>>>>>>>>>>Technical specifications
                  state.propertis.fold(
                    (error) {
                      return SliverToBoxAdapter(
                        child: Text(error),
                      );
                    },
                    (propertis) {
                      return TechnicalSection(
                        propertis: propertis,
                      );
                    },
                  ),

                  ///===========================================>>>>Descreption
                  DescreptionSection(product: widget),
                },

                //=====================================>>>> Comment
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      border: Border.all(
                        width: 1,
                        color: AppColor.secondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        spacing: 8,
                        children: [
                          Text(
                            'نظر کاربران',
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30,
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 45,
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('+10'),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            'مشاهده همه',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 14,
                                  color: AppColor.mainColor,
                                ),
                          ),
                          Assets.img.iconLeftCategroy.image()
                        ],
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //============================================>>>>>>.add Cart
                        AddCart(),
                        //=================================================>>>>>totla Price
                        TotlaPrice(widget: widget)
                      ],
                    ),
                  ),
                )
              },
            ],
          );
        },
      ),
    );
  }
}

class TechnicalSection extends StatefulWidget {
  final List<PropertisModel> propertis;
  const TechnicalSection({
    super.key,
    required this.propertis,
  });

  @override
  State<TechnicalSection> createState() => _TechnicalSectionState();
}

class _TechnicalSectionState extends State<TechnicalSection> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, isVisible ? 10 : 20),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 1,
                  color: AppColor.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  spacing: 8,
                  children: <Widget>[
                    Text(
                      'مشخصات فنی',
                    ),
                    Spacer(),
                    Text(
                      'مشاهده همه',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: AppColor.mainColor,
                          ),
                    ),
                    Assets.img.iconLeftCategroy.image()
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 1,
                  color: AppColor.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: widget.propertis.isNotEmpty
                    ? ListView.builder(
                        itemCount: widget.propertis.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var items = widget.propertis[index];
                          return Flexible(
                              child: Text('${items.title}  : ${items.value} '));
                        },
                      )
                    : Text('این محصول مشخصات فنی ندارد'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescreptionSection extends StatefulWidget {
  const DescreptionSection({
    super.key,
    required this.product,
  });

  final SingleProductScreen product;

  @override
  State<DescreptionSection> createState() => _DescreptionSectionState();
}

class _DescreptionSectionState extends State<DescreptionSection> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 10,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 1,
                  color: AppColor.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  spacing: 8,
                  children: [
                    Text(
                      'توضیحات محصول',
                    ),
                    Spacer(),
                    Text(
                      'مشاهده همه',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: AppColor.mainColor,
                          ),
                    ),
                    Assets.img.iconLeftCategroy.image()
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 1,
                  color: AppColor.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.product.singleProduct.description!,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//==============================================================>>>>VaraintContiner
class VaraintContinerGenerator extends StatelessWidget {
  final List<ProductVaraintModel> productVaraintModel;
  const VaraintContinerGenerator({
    super.key,
    required this.productVaraintModel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVaraint in productVaraintModel) ...{
            if (productVaraint.varaints.isNotEmpty) ...{
              VaraintGeneratorChild(
                productVaraintModel: productVaraint,
              )
            }
          }
        ],
      ),
    );
  }
}

class VaraintGeneratorChild extends StatelessWidget {
  final ProductVaraintModel productVaraintModel;
  const VaraintGeneratorChild({super.key, required this.productVaraintModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30, top: 20),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVaraintModel.varaintTypeModel.title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 14,
                ),
          ),
          if (productVaraintModel.varaintTypeModel.type ==
              VariantTypeEnum.COLOR) ...{
            VaraintColorClass(
              varaintColorList: productVaraintModel.varaints,
            )
          },
          if (productVaraintModel.varaintTypeModel.type ==
              VariantTypeEnum.STORAGE) ...{
            VaraintStorageClass(
              varaintStorageList: productVaraintModel.varaints,
            )
          }
        ],
      ),
    );
  }
}

//======================================================>>>> GalleySection
class GallerySection extends StatefulWidget {
  final String defaultImage;
  final List<GalleryModel> gallery;

  const GallerySection({
    super.key,
    required this.gallery,
    required this.defaultImage,
  });

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 44),
        height: 284,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Column(
          spacing: 30,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.img.iconFavoriteDeactive.image(),
                  Spacer(),
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ImageLoadingService(
                        mainImage: (widget.gallery.isNotEmpty)
                            ? widget.gallery[selectedIndex].image!
                            : widget.defaultImage,
                      )),
                  Spacer(),
                  Text('4.6'),
                  Assets.img.iconStar.image(),
                ],
              ),
            ),
            if (widget.gallery.isNotEmpty) ...{
              SizedBox(
                height: 71,
                child: ListView.builder(
                  itemCount: widget.gallery.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var items = widget.gallery[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        padding: EdgeInsets.all(7),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        child: ImageLoadingService(
                          mainImage: items.image!,
                        ),
                      ),
                    );
                  },
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}

//=================================================>>>>>totla Price
class TotlaPrice extends StatelessWidget {
  const TotlaPrice({
    super.key,
    required this.widget,
  });

  final SingleProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,
          decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.center,
              height: 53,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 36,
                      height: 15,
                      decoration: BoxDecoration(
                        color: AppColor.redColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                          '${widget.singleProduct.persent!.round().toString()}%',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColor.whiteColor,
                                    fontSize: 12,
                                  )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.singleProduct.price}'.seRagham(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColor.whiteColor,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColor.whiteColor,
                                  fontSize: 12),
                        ),
                        Text(
                          '${widget.singleProduct.realPeice}'.seRagham(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                        )
                      ],
                    ),
                    Text(
                      'تومان',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

//============================================>>>>>>.add Cart
class AddCart extends StatelessWidget {
  const AddCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,
          decoration: BoxDecoration(
            color: AppColor.mainColor,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.center,
              height: 53,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Text(
                'افزودن به سبد خرید',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 14,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

/// this Class build VaraintColor

class VaraintColorClass extends StatefulWidget {
  final List<VaraintsModel> varaintColorList;
  const VaraintColorClass({super.key, required this.varaintColorList});

  @override
  State<VaraintColorClass> createState() => _VaraintColorClassState();
}

class _VaraintColorClassState extends State<VaraintColorClass> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.varaintColorList.length,
        itemBuilder: (context, index) {
          var items = widget.varaintColorList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 8,
              ),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: items.getColor(),
                borderRadius: BorderRadius.circular(8),
                border: _selectedIndex == index
                    ? Border.all(color: AppColor.whiteColor, width: 4)
                    : Border.all(
                        color: AppColor.whiteColor,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// this Class build VaraintStorage
class VaraintStorageClass extends StatefulWidget {
  final List<VaraintsModel> varaintStorageList;
  const VaraintStorageClass({super.key, required this.varaintStorageList});

  @override
  State<VaraintStorageClass> createState() => _VaraintStorageClassState();
}

class _VaraintStorageClassState extends State<VaraintStorageClass> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.varaintStorageList.length,
        itemBuilder: (context, index) {
          var items = widget.varaintStorageList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 8,
              ),
              width: 60,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                  width: 1,
                  color: _selectedIndex == index
                      ? AppColor.mainColor
                      : AppColor.scaffoldColor,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Text(
                items.value!,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
