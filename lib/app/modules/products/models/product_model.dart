import 'dart:convert';

class ProductModel {
  final int id;

  final String title;

  final String description;

  final String image;

  final String category;

  final double price;

  final Map<String, dynamic> rating;

  ProductModel({
      required this.rating, 
      required this.title,
      required this.description,
      required this.image,
      required this.category,
      required this.id,
      required this.price});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'category': category,
      'price': price,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      category: map['category'],
      price: map['price'].runtimeType != double ? map['price'].toDouble() : map['price'],
      rating: Map<String, dynamic>.from(map['rating']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
