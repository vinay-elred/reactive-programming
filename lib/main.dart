import 'package:flutter/material.dart';
import 'package:reactive_programming/rx_features/publish_rx.dart';
import 'package:reactive_programming/view/shopping_cart.dart';

import 'reactive/view/reactive_cart.dart';
import 'rx_features/megre_streams.dart';
import 'rx_features/replay_rx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: ReactiveCart(),
      // home: ShoppingCart(),
      // home: ReplayRX(),
      // home: PublishRX(),
      home: MergeStreams(),
    );
  }
}
