import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:variemart/core/endpoints.dart';
import 'package:variemart/features/products/models/product_detail_model.dart';

class ProductDetailRepo {
  static Future<ProductDetailDataModel> fetchProductDetails(String id) async {
    var client = http.Client();

    try {
      var response = await client.get(Uri.parse("$productDetailUrl$id"));
      print("$productDetailUrl$id");

      var decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      return ProductDetailDataModel.fromMap(decodedResponse);
    } catch (e) {
      print(e);
      throw Exception("something went wrong");
    }
  }
}
