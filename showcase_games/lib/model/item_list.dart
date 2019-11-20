import './item.dart';

class ItemList {
  final List<Item> items;
  ItemList(this.items);
  ItemList.fromJson(List<dynamic> itemsJson)
      : items = itemsJson.map((item) => Item.fromJson(item)).toList();
}
