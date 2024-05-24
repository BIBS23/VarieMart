import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:variemart/core/endpoints.dart';
import 'package:variemart/features/home/models/product.dart';

class HomeRepo {
  static Future<List<ProductDataModel>> fetchHomeData() async {
    var client = http.Client();

    try {
      var response = await client.get(Uri.parse(productsUrl));

      List decodedResponse = jsonDecode(response.body);
      // print(response.body);
      List<ProductDataModel> productData = decodedResponse
          .map((prod) => ProductDataModel.fromMap(prod))
          .toList();
      return productData;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
