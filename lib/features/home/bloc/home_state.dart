// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadProducts extends HomeState {}

class HomeProducts extends HomeState {
  List<ProductDataModel> allProducts = [];
  HomeProducts({
    required this.allProducts,
  });
}

