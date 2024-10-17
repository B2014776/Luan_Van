import 'dart:convert';

class Product {
  final String id;
  final String name;
  final List<String> chemicalComposition;
  final String safetyInstructions;
  final String price;
  final int stock;
  final List<ImageProduct> images;

  Product({
    required this.id,
    required this.name,
    required this.chemicalComposition,
    required this.safetyInstructions,
    required this.price,
    required this.stock,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'];

    // Check if 'images' is a List or Map and process accordingly
    List<ImageProduct> imageList = [];

      imageList = imagesFromJson.map((i) => ImageProduct.fromJson(i)).toList();


    return Product(
      id: json['id'],
      name: json['name'],
      chemicalComposition: List<String>.from(json['chemical_composition'] ?? []),
      safetyInstructions: json['safety_instructions'] ?? '',
      price: json['price'].toString(),
      stock: json['stock'] ?? 0,
      images: imageList,
    );
  }
}

class ImageProduct {
  final String id;
  final String imageUrl;
  final String type;

  ImageProduct({
    required this.id,
    required this.imageUrl,
    required this.type,
  });

  factory ImageProduct.fromJson(Map<String, dynamic> json) {
    return ImageProduct(
      id: json['id'],
      imageUrl: json['image'],
      type: json['type'],
    );
  }
}
