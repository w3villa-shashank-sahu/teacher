class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final int stockQuantity;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.stockQuantity,
    required this.category,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      stockQuantity: json['stockQuantity'],
      category: json['category'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'stockQuantity': stockQuantity,
      'category': category,
    };
  }
}

class User {
  final String id;
  final String name;
  final String parentEmail;
  final String phoneNumber;
  final double emergencyBal;

  User({
    required this.id,
    required this.name,
    required this.parentEmail,
    required this.emergencyBal,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      parentEmail: json['parentEmail'],
      phoneNumber: json['phoneNumber'],
      emergencyBal: json['emergencyBal'],
    );
  }
}
