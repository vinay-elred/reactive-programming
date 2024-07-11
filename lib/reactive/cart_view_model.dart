import 'package:reactive_programming/reactive/ovservable.dart';
import 'package:reactive_programming/reactive/ovserver.dart';

class CartViewModel implements Observable<int> {
  CartViewModel._();
  static final CartViewModel _instance = CartViewModel._();
  factory CartViewModel() => _instance;

  final List<Observer> _observers = [];
  int _orderCount = 0;
  int get orderCount => _orderCount;

  void addItem() {
    _orderCount += 1;
    notifyObservers(_orderCount);
  }

  @override
  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void notifyObservers(newValue) {
    for (final ob in _observers) {
      ob.notifyChange(newValue);
    }
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }
}
