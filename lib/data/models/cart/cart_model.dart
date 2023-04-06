class CartFields {
  static String id = "id";
  static String image = "image";
  static String price = "price";
  static String description = "description";
  static String productName = "product_name";
  static String count = "count";
}

class CartModel {
  final int? id;
  final String productName;
  final String description;
  final String image;
  final int price;
  final int count;

  CartModel({
    this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.price,
    required this.count,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int? ?? 0,
      productName: json['product_name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      image: json['image'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      count: json["count"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_name": productName,
      'price': price,
      "image": image,
      'description': description,
      'count': count,
    };
  }

  CartModel copyWith({
    int? id,
    int? price,
    int? count,
    String? productId,
    String? productName,
    String? categoryId,
    String? description,
    String? image,
    String? createdAt,
  }) {
    return CartModel(
      id: id ?? this.id,
      count: count ?? this.count,
      price: price ?? this.price,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
