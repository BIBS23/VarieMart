part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class LoadCart extends CartState {}

class CartList extends CartState {
  final List< DisplayCartDataModel> cartList;
  CartList({
    required this.cartList
  });
}
