import 'package:flutter/material.dart';

import '../model/cart_item_model.dart';
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
      body: Center(
        child: StreamBuilder(
          stream: vm.allCartItems,
          builder: (context, snapshot) {
            if (snapshot.data?.isEmpty ?? true) {
              return const Text("Empty cart");
            }

            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: snapshot.data?.map(itemCard).toList() ?? [],
            );
          },
        ),
      ),
    );
  }

  Widget itemCard(CartItemModel e) {
    final vm = ShoppingCartViewModel();

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(e.id.toString()),
          const SizedBox(
            height: 10,
            width: 100,
          ),
          IconButton(
            onPressed: () => vm.toggleLike(e),
            icon: StreamBuilder(
              stream: vm.allCartItems,
              builder: (context, snapshot) {
                bool isLike = vm.isLiked(e);
                if (isLike) {
                  return const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  );
                }
                return const Icon(Icons.favorite_outline);
              },
            ),
          ),
        ],
      ),
    );
  }
}
