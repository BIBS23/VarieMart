import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:variemart/features/products/models/product_detail_model.dart';
import 'package:variemart/features/products/repository/product_detail_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProductDetail>(fetchProductDetail);
  }

  FutureOr<void> fetchProductDetail(
      FetchProductDetail event, Emitter<ProductState> emit) async {
    emit(LoadProductDetail());
    // print("this is the product ids ${event.productId}");
    ProductDetailDataModel productDetail =
        await ProductDetailRepo.fetchProductDetails(event.productId.toString());
    emit(ProductDetailState(prodDetail: productDetail));
  }
}
