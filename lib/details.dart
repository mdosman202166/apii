import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Deatils extends StatefulWidget {
String deatilsurl;


Deatils(this.deatilsurl);

  @override
  _DeatilsState createState() => _DeatilsState();
}

class _DeatilsState extends State<Deatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text
          ("details"),
      ),
      body:WebView(
        initialUrl: widget.deatilsurl,
        javascriptMode: JavascriptMode.unrestricted,
      ) ,


    );
  }
}

