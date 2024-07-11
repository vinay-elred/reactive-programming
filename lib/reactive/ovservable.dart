import 'ovserver.dart';

abstract class Observable<T> {
  void addObserver(Observer<T> observer) {}
  void removeObserver(Observer<T> observer) {}
  void notifyObservers(T newValue) {}
}