import 'package:flutter/cupertino.dart';

class ItemProvider with ChangeNotifier {
  final List<int> _selecteditem = [];

  List<int> get selecteitem => _selecteditem;
  void addToCart(item) {
    _selecteditem.add(item);
    notifyListeners();
  }
  void removeItem(item) {
    _selecteditem.remove(item);
    notifyListeners();
  }
}
