import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variemart/core/colors.dart';
import 'package:variemart/features/home/bloc/home_bloc.dart';
import 'package:variemart/features/products/bloc/product_bloc.dart';
import 'package:variemart/features/products/views/product_view.dart';
import 'package:variemart/features/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "VarieMart",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadProducts:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeProducts:
              var successState = state as HomeProducts;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemCount: successState.allProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<ProductBloc>(context).add(
                        FetchProductDetail(
                            productId:
                                successState.allProducts[index].id.toString()),
                      );
                    
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductDetailView()),);
                    },
                    child: ProductCard(
                        title: successState.allProducts[index].title,
                        price: successState.allProducts[index].price.toString(),
                        image: successState.allProducts[index].image),
                  );
                },
              );

            default:
              const SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
