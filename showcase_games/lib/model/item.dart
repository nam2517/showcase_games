class Item {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Item({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Item.fromJson(Map json)
      : albumId = json["albumId"],
        id = json["id"],
        title = json["title"],
        url = json["url"],
        thumbnailUrl = json["thumbnailUrl"];
}
