import 'package:flutter/material.dart';
import 'model/item.dart';
import 'api.dart';
import 'web_game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listItem = List<Item>();

  _getItems() {
    API.getItems().then((response) {
      setState(() {
        Iterable list = response;
        listItem = list.map((model) => Item.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    _getItems();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future refreshList() async {
    _getItems();
  }

  @override
  Widget build(BuildContext context) {
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
        body: RefreshIndicator(
          onRefresh: refreshList,
          child: Container(
            color: Colors.black26,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      getImageItem(index),
                      getIdAndAlbumId(index),
                      getDecription(index),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }

  // Get description
  Align getDecription(int index) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text("${listItem[index].title}")),
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

  // get Id and album Id
  Align getIdAndAlbumId(int index) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Album Id: " + "${listItem[index].id}"),
            Text("Id: " + "${listItem[index].albumId}"),
          ],
        ),
      ),
      alignment: Alignment.topLeft,
    );
  }

  // Get Image
  Container getImageItem(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
            fit: BoxFit.fill, image: NetworkImage(listItem[index].url)),
      ),
    );
  }
}
