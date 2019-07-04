import 'package:flutter/material.dart';

class CustomNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Page'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("go to second page"),
          onPressed: () {
            Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return CustomNavigatorSecondPage();
              },
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) =>
                new FadeTransition(
                  opacity: animation,
                  child: new RotationTransition(
                    turns: new Tween<double>(begin: 0.0, end: 1.0)
                        .animate(animation),
                    child: child,
                  ),
                ),
            ));
          },
        ),
      ),
    );
  }
}

class CustomNavigatorSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("go to first page"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}



