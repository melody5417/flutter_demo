// 参考：https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac

import 'package:flutter/material.dart';

class ScrollStatusPage extends StatefulWidget {
  @override
  _ScrollStatusPageState createState() => _ScrollStatusPageState();
}

class _ScrollStatusPageState extends State<ScrollStatusPage> {
  String message = "";

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
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification.metrics);
                }
                return true;
              },
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("Index + $index"));
                },
              ),
            )
          ),
        ],
      ),
    );
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Start";
    });
  }
  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Update";
    });
  }
  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll End";
    });
  }
}
