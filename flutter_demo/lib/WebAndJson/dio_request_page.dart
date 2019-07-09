import 'package:flutter/material.dart';

import 'dio.dart';

class DioRequestPage extends StatefulWidget {
  @override
  _DioRequestPageState createState() => _DioRequestPageState();
}

class _DioRequestPageState extends State<DioRequestPage> {
  String _text = "placeholder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio request"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text("Request"),
                onPressed: () {
                  dio.get("https://www.douban.com/").then((response) {
                    setState(() {
                      _text = response.data.toString();
                    });
                  });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(_text),
                ),
              )
            ]),
      ),
    );
  }
}
