// 参考：https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac

import 'package:flutter/material.dart';

class ScrollMovermentPage extends StatefulWidget {
  @override
  _ScrollMovermentPageState createState() => _ScrollMovermentPageState();
}

class _ScrollMovermentPageState extends State<ScrollMovermentPage> {
  final itemSize = 100.0;
  final pixelsToMove = 200.0;
  ScrollController _controller;

  _moveUp() {
    // with animation
    _controller.animateTo(
        _controller.offset - itemSize,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear);
  }

  _moveDown() {
    _controller.jumpTo(_controller.offset + pixelsToMove);
  }

  @override
  void initState() {
    _controller = ScrollController();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                      child: Text("up"),
                      onPressed: _moveUp),
                  RaisedButton(
                      child: Text("down"),
                      onPressed: _moveDown),
                ],
              ),
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
}
