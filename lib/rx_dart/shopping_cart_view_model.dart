import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../model/cart_item_model.dart';

class ShoppingCartViewModel {
  ShoppingCartViewModel._();
  static final ShoppingCartViewModel _instance = ShoppingCartViewModel._();
  factory ShoppingCartViewModel() => _instance;

  final List<CartItemModel> items = List.generate(
    10,
    (index) => CartItemModel(id: index, isLiked: false),
  );

  final BehaviorSubject<List<CartItemModel>> _cartItemsSubject =
      BehaviorSubject();
  final List<CartItemModel> _cartItems = [];
  Stream<List<CartItemModel>> get allCartItems => _cartItemsSubject.stream;

  bool isLiked(CartItemModel item) {
    final list = _cartItems.where((e) => e.id == item.id);
    return list.isEmpty ? false : list.first.isLiked;
  }

  void toggleLike(CartItemModel item) {
    final index = _cartItems.indexWhere((e) => e.id == item.id);
    if (index == -1) {
      final newData = item.copyWith(isLiked: !item.isLiked);
      _cartItems.add(newData);
    } else {
      _cartItems.removeAt(index);
    }
    _cartItemsSubject.add(_cartItems);
  }

  void dispose() {
    _cartItemsSubject.close();
  }
}
