part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class FetchProductDetail extends ProductEvent {
  final String productId;

  FetchProductDetail({required this.productId});
}

