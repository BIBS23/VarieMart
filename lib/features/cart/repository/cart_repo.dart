import 'dart:convert';

import 'package:variemart/core/endpoints.dart';
import 'package:variemart/features/cart/models/cart_model_data.dart';
import 'package:http/http.dart' as http;
import 'package:variemart/features/cart/models/display_cart_data_model.dart';

class CartRepo {
  static Future<List<DisplayCartDataModel>> fetchCart() async {
    var client = http.Client();

    try {
      var response = await client.get(Uri.parse("$cartUrl/5"));

      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);

      CartDataModel cartData = CartDataModel.fromMap(decodedResponse);
      List<DisplayCartDataModel> myCartData = [];
      // Fetch product details for each product in the cart
      for (var product in cartData.products) {
        var productResponse = await client
            .get(Uri.parse("$productDetailUrl/${product.productId}"));
        var productDetails = jsonDecode(productResponse.body);
        // Assuming you have a method in CartDataModel to update product details
        myCartData.add(DisplayCartDataModel.fromMap(productDetails));
        // myCartData = DisplayCartDataModel.fromMap(productDetails);
        print("done $myCartData");
      }
      return myCartData;
    } catch (e) {
      print(e);
      return throw Exception();
    }
  }
}
