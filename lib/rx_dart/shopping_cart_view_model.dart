import 'package:rxdart/rxdart.dart';

class ShoppingCartViewModel {
  ShoppingCartViewModel._();
  static final ShoppingCartViewModel _instance = ShoppingCartViewModel._();
  factory ShoppingCartViewModel() => _instance;

  int _cartItem = 0;
  final BehaviorSubject<int> _behaviourSubject = BehaviorSubject<int>();

  Stream<int> get cartCount => _behaviourSubject.stream;

  void addItem() async {
    _cartItem++;
    _behaviourSubject.add(_cartItem);
  }

  void dispose() {
    _behaviourSubject.close();
  }
}
