import 'package:flutter/material.dart';

import '../rx_dart/shopping_cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = ShoppingCartViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart items'),
      ),
      body: Column(
        children: [
          StreamBuilder<Object>(
            stream: vm.cartCount,
            builder: (context, snapshot) {
              if (snapshot.data == null) return const Text("Empty cart");
              return Text('Cart items : ${snapshot.data.toString()}');
            },
          ),
        ],
      ),
    );
  }
}
