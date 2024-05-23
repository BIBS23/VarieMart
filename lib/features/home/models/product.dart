import 'dart:convert';

class ProductDataModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  ProductDataModel({
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

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'].toDouble(),
      category: map['category'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDataModel.fromJson(String source) => ProductDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
