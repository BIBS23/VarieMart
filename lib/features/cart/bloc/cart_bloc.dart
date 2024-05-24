import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:variemart/features/cart/models/display_cart_data_model.dart';
import 'package:variemart/features/cart/repository/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<MyCart>(myCart);
  }

  FutureOr<void> myCart(MyCart event, Emitter<CartState> emit) async {
    emit(LoadCart());
   List<  DisplayCartDataModel> myCart = await CartRepo.fetchCart();
    print(myCart);
    emit(CartList(cartList: myCart));
  }
}
