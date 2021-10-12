import 'package:bloc_kullanimi1/models/product.dart';

class ProductService {
  //1
  ProductService._internal();
  //2
  static final ProductService _singleton = ProductService._internal();
  //3
  factory ProductService() {
    return _singleton;
  }

  //değişkenler
  static List<Product> products = [];

  //metodlar

  static List<Product> getAll() {
    products.add(
      Product(1, "Acer Laptop", 6000),
    );
    products.add(
      Product(2, "IPhone", 1000),
    );
    products.add(
      Product(3, "Razer Mouse", 900),
    );

    return products;
  }
}
