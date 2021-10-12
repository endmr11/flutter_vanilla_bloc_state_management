import 'package:bloc_kullanimi1/blocs/cart_bloc.dart';
import 'package:bloc_kullanimi1/models/cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sepet",
        ),
        centerTitle: true,
      ),
      body: buildCartList(),
    );
  }

  StreamBuilder<dynamic> buildCartList() {
    return StreamBuilder(
      initialData: cartBloc.getCart(),
      stream: cartBloc.getStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.data.length > 0
            ? buildCartListItems(snapshot)
            : const Center(
                child: Text(
                  "BOŞ",
                ),
              );
      },
    );
  }

  ListView buildCartListItems(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(
            list[index].product.name,
          ),
          subtitle: Text(
            list[index].product.price.toString(),
          ),
          trailing: IconButton(
            onPressed: () => cartBloc.removeFromCart(list[index]),
            icon: const Icon(
              Icons.remove_shopping_cart,
            ),
          ),
        );
      },
    );
  }
}
