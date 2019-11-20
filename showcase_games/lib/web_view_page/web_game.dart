import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class WebGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FlutterWebviewPlugin webviewPlugin = new FlutterWebviewPlugin();

    void _showDialog() {
      webviewPlugin.hide();
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(" HÃY KIÊN NHẪN"),
            content: new Text("Phần thưởng 3 Biggy đang chờ"),
            actions: <Widget>[
              FlatButton(
                color: Colors.black26,
                child: new Text("CHƠI TIẾP"),
                onPressed: () {
                  Navigator.pop(context);
                  webviewPlugin.show();
                },
              ),
              FlatButton(
                color: Colors.black26,
                child: new Text("DỪNG LẠI"),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              )
            ],
          );
        },
      );
    }

    return WebviewScaffold(
      appBar: AppBar(
        title: Text(
          "Giải trí",
          style: TextStyle(fontSize: 18.0, color: Colors.black87),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black45,
                ),
                onPressed: _showDialog,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xFFE9D7C9),
      ),
      url: "https://ssd-asia.com/files/minigames/line/",
    );
  }
}
