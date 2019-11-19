import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcase_games/provider/item_provider.dart';
import 'model/item.dart';
import 'web_game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        FutureProvider(builder: (context) => ItemProvider().loadItemData()),
      ], child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listItem = List<Item>();

  @override
  void dispose() {
    super.dispose();
  }

  Future refreshList() async {
    print("Refresh");
  }

  @override
  Widget build(BuildContext context) {
    var _items = Provider.of<List<Item>>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF79BE29),
          title: Text("Giải trí"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {},
            ),
          ],
        ),
        body: _items == null
            ? Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
            : RefreshIndicator(
                onRefresh: refreshList,
                child: Container(
                  color: Colors.black26,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        height: 200,
                        child: Stack(
                          children: <Widget>[
                            Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.black54,
                            )),
                            getImage(_items, index),
                            getIdAndAlbumId(_items, index),
                            getDescription(context, _items, index),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ));
  }

  // Get Id and Album Id
  Align getIdAndAlbumId(List<Item> _items, int index) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Album Id: " + "${_items[index].id}"),
            Text("Id: " + "${_items[index].albumId}"),
          ],
        ),
      ),
      alignment: Alignment.topLeft,
    );
  }

  // Get image
  Container getImage(List<Item> _items, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
            fit: BoxFit.fill, image: NetworkImage(_items[index].url)),
      ),
    );
  }

  // Get description
  Align getDescription(BuildContext context, List<Item> _items, int index) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text("${_items[index].title}")),
            RaisedButton(
              color: Color(0xFF79BE29),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => WebGame()));
              },
              child: Text(
                "CHƠI NGAY",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      alignment: Alignment.bottomLeft,
    );
  }
}
