import 'package:apple_shop/data/repository/cart_item_repository.dart';
import 'package:apple_shop/data/repository/singleProduct_repositroy.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/model/gallery_model.dart';
import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/model/product_varaint_model.dart';
import 'package:apple_shop/model/propertis_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'productsingle_event.dart';
part 'productsingle_state.dart';

class ProductsingleBloc extends Bloc<ProductsingleEvent, ProductsingleState> {
  final ISingleProductRepositroy productRepositroy = locator.get();
  final ICartItemRepositroy cartItemRepositroy = locator.get();

  ProductsingleBloc() : super(ProductsingleInitialState()) {
    on<ProductsingleEvent>(
      (event, emit) async {
        if (event is ProductSingleInitEvent) {
          emit(ProductSingleLoadingStateate());

          var productGallary = await productRepositroy.getGalley(event.id);
          var mainProductVaraint =
              await productRepositroy.getProdductVaraintModel(event.id);
          var category = await productRepositroy.getCategory(event.categryId);
          var propertis = await productRepositroy.getPropertis(event.id);
          emit(
            ProductSingleSuceesStateate(
              gallary: productGallary,
              productVaraint: mainProductVaraint,
              category: category,
              propertis: propertis,
            ),
          );
        }
        if (event is ProdoctAddCartEvent) {
          var items = CartItemModel(
            id: event.product.id,
            name: event.product.name,
            price: event.product.price,
            persent: event.product.persent,
            thumbnail: event.product.thumbnail,
            realPeice: event.product.realPeice,
            collectionId: event.product.collectionId,
            category: event.product.category,
          );
          cartItemRepositroy.addCartItem(items);
        }
      },
    );
  }
}


// this.category,










//     this.persent,