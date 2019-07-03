import 'package:flutter/material.dart';

class RouteResultListPage extends StatefulWidget {
  @override
  _RouteResultListPageState createState() => _RouteResultListPageState();
}

class _RouteResultListPageState extends State<RouteResultListPage> {
  List<int> items = new List.generate(10, (index) => index * index);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RouteResultListPage'),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text("index ${items[index]}"),
            onTap: () async {
              final result = await Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new RouteResultItemPage(item: items[index],),
                  )
              );
              setState(() {
                items[index] = result;
              });
            },
          );
        },
      ),
    );
  }
}

class RouteResultItemPage extends StatefulWidget {
  int item;

  RouteResultItemPage({Key key, this.item}): super(key: key);

  @override
  _RouteResultItemPageState createState() => _RouteResultItemPageState();
}

class _RouteResultItemPageState extends State<RouteResultItemPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Item Page: $widget.item'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("go to f page"),
          onPressed: () {
            Navigator.pop(context, widget.item - 10);
          },
        ),
      ),
    );
  }
}


