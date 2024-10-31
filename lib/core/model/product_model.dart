import 'dart:convert';

class ProductModel {
  final String id;
  final List<ImageProduct> images;
  final String name;
  final String chemicalComposition;
  final String safetyInstructions;
  final String description;
  final String price;
  final int stock;
  final DateTime dateAdded;
  final String productType;

  ProductModel({
    required this.id,
    required this.images,
    required this.name,
    required this.chemicalComposition,
    required this.safetyInstructions,
    required this.description,
    required this.price,
    required this.stock,
    required this.dateAdded,
    required this.productType,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var imageList = json['images'] as List;
    List<ImageProduct> images = imageList.map((i) => ImageProduct.fromJson(i)).toList();
    String productType = getProductType(json['product_type']);

    return ProductModel(
      id: json['id'],
      images: images,
      name: utf8.decode(json['name'].runes.toList()), // Giải mã chuỗi
      chemicalComposition: utf8.decode(json['chemical_composition'].runes.toList()),
      safetyInstructions: utf8.decode(json['safety_instructions'].runes.toList()),
      description: utf8.decode(json['description'].runes.toList()),
      price: json['price'],
      stock: json['stock'],
      dateAdded: DateTime.parse(json['date_added']),
      productType: productType,
    );
  }

  static String getProductType(String id) {
    switch (id) {
      case "b4eeb7b9-9b52-4851-98fa-52c2b1cf486d":
        return "Phân bón";
      case "fc419c7a-0c38-4ba5-becb-88b89bb191dd":
        return "Hữu cơ sinh học";
      case "996f4cd0-5688-4d20-a1c2-da498b760272":
        return "Nông dược";
      default:
        return "Không xác định"; // Giá trị mặc định nếu không khớp
    }
  }
}

class ImageProduct {
  final String id;
  final String image;
  final String type;
  final String product;

  ImageProduct({
    required this.id,
    required this.image,
    required this.type,
    required this.product,
  });

  factory ImageProduct.fromJson(Map<String, dynamic> json) {
    return ImageProduct(
      id: json['id'],
      image: json['image'],
      type: json['type'],
      product: json['product'], // Thêm trường product
    );
  }
}
