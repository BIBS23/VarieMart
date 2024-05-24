// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

class ProductInitial extends ProductState {
 
}

class LoadProductDetail extends ProductState {}


class ProductDetailState extends ProductState {
  final ProductDetailDataModel prodDetail;
  ProductDetailState({
    required this.prodDetail,
  });

  
}

