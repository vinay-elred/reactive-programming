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
        itemBuilder: (context, index) {
          return InkWell(
            onTap: vm.addItem,
            child: Container(
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
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
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
          stream: vm.cartCount,
          builder: (context, snapshot) {
            if (snapshot.data == null) return const Icon(Icons.card_travel);
            return Text(snapshot.data.toString());
          },
        ),
      ),
    );
  }
}
