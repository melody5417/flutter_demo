// 参考：https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac

import 'package:flutter/material.dart';

class ScrollLimitReachedPage extends StatefulWidget {
  @override
  _ScrollLimitReachedPageState createState() => _ScrollLimitReachedPageState();
}

class _ScrollLimitReachedPageState extends State<ScrollLimitReachedPage> {
  ScrollController _controller;
  String message = "";

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.green,
            child: Center(
              child: Text(message),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(title: Text("index: $index"));
              },
            ),
          ),
        ],
      ),
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent
    && !_controller.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
      });
    }

    if (_controller.offset <= _controller.position.minScrollExtent
    && !_controller.position.outOfRange) {
      setState(() {
        message = "reach the top";
      });
    }
  }

}
