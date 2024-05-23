import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variemart/core/colors.dart';
import 'package:variemart/features/products/bloc/product_bloc.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadProductDetail:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProductDetailState:
              var successState = state as ProductDetailState;
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    Image.network(
                      successState.prodDetail.image.toString(),
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      successState.prodDetail.category,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 15,color: kPrimaryColor,fontWeight: FontWeight.w900,letterSpacing: 4),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      successState.prodDetail.title,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "₹ ${successState.prodDetail.price.toString()}",
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Product Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      successState.prodDetail.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 15,letterSpacing: 1),
                    ),
                      
                  ],
                ),
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
