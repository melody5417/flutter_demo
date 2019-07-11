import 'package:flutter/material.dart';
import 'package:melody_flutter_demo/State/count_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedPageChild extends StatefulWidget {
  @override
  _ScopedPageChildState createState() => _ScopedPageChildState();
}

class _ScopedPageChildState extends State<ScopedPageChild> {
  @override
  Widget build(BuildContext context) {
    // Note
    var count = CountModel.of(context).count;
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: new AppBar(
            title: new Text('scoped page child'),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('You have pushed the button this many times: '),
                new Text('${model.count}'),
                new Text('$count')
              ],
            ),
          ),
        );
      },
    );
  }
}
