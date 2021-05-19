import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String webURL;

  ArticleView({this.webURL});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
   final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Opacity(opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.category))),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('India',
            style: TextStyle(fontSize: 27, color: Colors.orange),),
            SizedBox(
              width: 3,
            ),
            Text(
              'Today',
              style: TextStyle(fontSize: 27, color: Colors.green),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.webURL,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        )
      ),
    );
  }
}
