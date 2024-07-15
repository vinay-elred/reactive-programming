import 'package:flutter/material.dart';
import 'package:reactive_programming/rx_dart/shopping_cart_view_model.dart';
import 'package:reactive_programming/view/cart_screen.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = ShoppingCartViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: vm.items.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            color: Colors.amber,
            height: 100,
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$index'),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () => vm.toggleLike(vm.items[index]),
                  icon: StreamBuilder(
                    stream: vm.allCartItems,
                    builder: (context, snapshot) {
                      bool isLike = vm.isLiked(vm.items[index]);
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
        },
        child: StreamBuilder(
          stream: vm.allCartItems,
          builder: (context, snapshot) {
            final len = snapshot.data?.length ?? 0;
            if (len == 0) return const Icon(Icons.card_travel);
            return Text(len.toString());
          },
        ),
      ),
    );
  }
}
