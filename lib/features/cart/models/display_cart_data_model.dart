// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DisplayCartDataModel {
  final String title;
  final String image;
  final double price;
  final Rating rating;
  DisplayCartDataModel({
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'price': price,
      'rating': rating.toMap(),
    };
  }

  factory DisplayCartDataModel.fromMap(Map<String, dynamic> map) {
    return DisplayCartDataModel(
      title: map['title'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      rating: Rating.fromMap(map['rating'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayCartDataModel.fromJson(String source) => DisplayCartDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rating {
  final double rate;
  final int count;
  Rating({
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    
    return Rating(
      rate: (map['rate']).toDouble(),
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);
}
