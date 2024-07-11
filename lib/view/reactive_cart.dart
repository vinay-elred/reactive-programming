import 'package:flutter/material.dart';

import '../reactive/ovserver.dart';
import '../reactive/cart_view_model.dart';

class ReactiveCart extends StatefulWidget {
  const ReactiveCart({super.key});

  @override
  State<ReactiveCart> createState() => _ReactiveCartState();
}

class _ReactiveCartState extends State<ReactiveCart> implements Observer<int> {
  final cartVM = CartViewModel();
  int cartCount = 0;

  @override
  void initState() {
    cartVM.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cart Data"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cartCount.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => cartVM.addItem(),
                child: const Text('add item'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void notifyChange(int newValue) {
    cartCount = newValue;
    setState(() {});
  }

  @override
  void dispose() {
    cartVM.removeObserver(this);
    super.dispose();
  }
}
