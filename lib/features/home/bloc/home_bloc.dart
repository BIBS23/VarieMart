import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:variemart/features/home/models/product.dart';
import 'package:variemart/features/home/repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchHomeData>(fetchHomeData);
  }

  FutureOr<void> fetchHomeData(
      FetchHomeData event, Emitter<HomeState> emit) async {
    emit(LoadProducts());
    List<ProductDataModel> allProducts = await HomeRepo.fetchHomeData();
    // print(allProducts);
    emit(HomeProducts(allProducts: allProducts));
  }


}
