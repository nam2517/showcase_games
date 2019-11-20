import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/item_list.dart';
import '../model/item.dart';

const url = "https://jsonplaceholder.typicode.com/photos";

class ItemProvider {
  List<Item> _items;
  Future<List<Item>> loadItemData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      _items = ItemList.fromJson(jsonResponse).items;
      return _items;
    } else {
      throw Exception("Error while fetching data");
    }
  }

  Future<List<Item>> decrease() async {
    _items = _items.sublist(1, 3);
    return _items;
  }
}
