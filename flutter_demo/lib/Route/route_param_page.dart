import 'package:flutter/material.dart';

class RouteParamListPage extends StatelessWidget {
  final List<int> items = new List.generate(10, (index) => index * index);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List Page'),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text("index ${items[index]}"),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new RouteParamItemPage(items[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class RouteParamItemPage extends StatelessWidget {
  final int item;

  RouteParamItemPage(this.item);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Item Page: $item'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("go to f page"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}



