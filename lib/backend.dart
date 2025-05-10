import 'package:dio/dio.dart';
import 'package:teacher/models.dart';

const String baseUrl = 'https://api.example.com/';

// Teacher APP

Future<User> fetchUser() async {
  // return dummy user data
  return User(
    id: '232780',
    name: 'Shashank sahu',
    parentEmail: 'shashank.sahu@example.com',
    phoneNumber: '1234567890',
    emergencyBal: 1000.0,
  );

  final dio = Dio();
  final response = await dio.get('${baseUrl}user');
  if (response.statusCode == 200) {
    return User.fromJson(response.data);
  } else {
    throw Exception('Failed to load user');
  }
}

// only product tagged with Emergency
Future<List<Product>> fetchProducts() async {
  // return dummy product data
  const String defaultProductImage = 'assets/images/image.jpg';
  return [
    Product(
      id: '1',
      name: 'Samosa',
      price: 10.0,
      imageUrl: defaultProductImage,
      stockQuantity: 100,
      category: 'Food',
    ),
    Product(
      id: '2',
      name: 'Book',
      price: 20.0,
      imageUrl: defaultProductImage,
      stockQuantity: 50,
      category: 'Stationary',
    ),
    Product(
      id: '3',
      name: 'Pen',
      price: 5.0,
      imageUrl: defaultProductImage,
      stockQuantity: 50,
      category: 'Stationary',
    ),
    Product(
      id: '3',
      name: 'Maggie',
      price: 30.0,
      imageUrl: defaultProductImage,
      stockQuantity: 50,
      category: 'Snack',
    ),
  ];

  final dio = Dio();
  final response = await dio.get('${baseUrl}products');
  if (response.statusCode == 200) {
    List<Product> products = (response.data as List).map((product) => Product.fromJson(product)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

// Add Alloted Product to the the student
Future<void> allotProduct(List<Product> product, List<int> quantity) async {
  return;
  // Create a list of maps where each map contains product ID and quantity
  final List<Map<String, dynamic>> allotmentData = List.generate(
    product.length,
    (index) => {
      'productId': product[index].id,
      'quantity': quantity[index],
    },
  );

  // Use this as your request data
  final data = {'allotments': allotmentData};
  final dio = Dio();
  final response = await dio.post(
    '${baseUrl}allotment',
    data: data,
  );
  if (response.statusCode == 200) {
    print('Product allotted successfully');
  } else {
    throw Exception('Failed to allot product');
  }
}
