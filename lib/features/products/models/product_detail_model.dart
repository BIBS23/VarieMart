import 'dart:convert';

class ProductDetailDataModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  ProductDetailDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }

  factory ProductDetailDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailDataModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'].toDouble(),
      category: map['category'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailDataModel.fromJson(String source) => ProductDetailDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
