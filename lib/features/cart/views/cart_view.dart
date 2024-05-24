import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variemart/core/colors.dart';
import 'package:variemart/features/cart/bloc/cart_bloc.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "My cart",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadCart:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CartList:
              var successState = state as CartList;

              return Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                    itemCount: successState.cartList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              successState.cartList[index].image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.65, // Adjust width as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    successState.cartList[index].title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "\$ ${successState.cartList[index].price.toString()}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Rating ${successState.cartList[index].rating.rate.toString()}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
