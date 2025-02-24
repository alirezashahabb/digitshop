import 'package:apple_shop/data/repository/prodoct_repositroy.dart';
import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'prodoct_list_event.dart';
part 'prodoct_list_state.dart';

class ProdoctListBloc extends Bloc<ProdoctListEvent, ProdoctListState> {
  final IProductRepositroy productRepositroy = locator.get();
  ProdoctListBloc() : super(ProdoctListLoadingState()) {
    on<ProdoctListEvent>(
      (event, emit) async {
        if (event is ProductListInitEvent) {
          emit(ProdoctListLoadingState());
          var productListCategory =
              await productRepositroy.getProductList(event.categortId);

          emit(
            ProdoctListSucessState(
              productList: productListCategory,
            ),
          );
        }
      },
    );
  }
}
