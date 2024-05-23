part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchHomeData extends HomeEvent {}

class ProductClicked extends HomeEvent {
   final int productId;

  ProductClicked({required this.productId});

  
}

