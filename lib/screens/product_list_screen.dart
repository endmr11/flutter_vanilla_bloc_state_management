import 'package:bloc_kullanimi1/blocs/cart_bloc.dart';
import 'package:bloc_kullanimi1/blocs/product_bloc.dart';
import 'package:bloc_kullanimi1/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ürünler",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/cart"),
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: buildProductList(),
    );
  }

  StreamBuilder<dynamic> buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.data.length > 0
            ? buildProductListItems(snapshot)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  ListView buildProductListItems(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(
            list[index].name,
          ),
          subtitle: Text(
            list[index].price.toString(),
          ),
          trailing: IconButton(
            onPressed: () => cartBloc.addToCart(Cart(list[index], 1)),
            icon: const Icon(
              Icons.add_shopping_cart,
            ),
          ),
        );
      },
    );
  }
}
