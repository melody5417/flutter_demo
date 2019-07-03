import 'package:flutter/material.dart';

class RouteSimpleFirstPage extends StatelessWidget {
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
            Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new RouteSimpleSecondPage())
            );
          },
        ),
      ),
    );
  }
}

class RouteSimpleSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
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



