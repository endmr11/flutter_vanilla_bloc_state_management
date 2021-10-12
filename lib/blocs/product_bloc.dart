import 'dart:async';
import 'package:bloc_kullanimi1/data/product_service.dart';
import 'package:bloc_kullanimi1/models/product.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<Product> getAll() {
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();
