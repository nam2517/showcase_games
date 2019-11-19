import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/item_list.dart';
import '../model/item.dart';

const url = "https://jsonplaceholder.typicode.com/photos";
List<Item> items;

class ItemProvider {
  Future<List<Item>> loadItemData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      items = ItemList.fromJson(jsonResponse).items;
      //print(items);
      return items;
    } else {
      throw Exception("Error while fetching data");
    }
  }
}
