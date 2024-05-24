// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartDataModel {
  int userId;
  int id;
  List<CartData> products;
  CartDataModel({
    required this.userId,
    required this.id,
    required this.products,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory CartDataModel.fromMap(Map<String, dynamic> map) {
    return CartDataModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      products: List<CartData>.from((map['products'] as List<dynamic>).map<CartData>((x) => CartData.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartDataModel.fromJson(String source) => CartDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CartData {
  int productId;
  int quantity;
  CartData({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartData.fromMap(Map<String, dynamic> map) {
    return CartData(
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartData.fromJson(String source) => CartData.fromMap(json.decode(source) as Map<String, dynamic>);
}
