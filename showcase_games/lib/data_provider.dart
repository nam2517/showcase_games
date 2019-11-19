import 'dart:collection';

import 'package:flutter/material.dart';
import 'model/item.dart';

class DataProvider with ChangeNotifier {
  final List<Item> _listItem = [];
  int _totalGamePlayed = 0;

  // Unmodifiable
  UnmodifiableListView<Item> get listItem => UnmodifiableListView(_listItem);
  // total Item
  int get totalGamePlayed => _totalGamePlayed;

  // Adds [Item] This is the only way to modify

  void add(Item item) {
    _listItem.add(item);
    notifyListeners();
  }

  void incrementCount() {
    _totalGamePlayed++;
    notifyListeners();
  }
}
