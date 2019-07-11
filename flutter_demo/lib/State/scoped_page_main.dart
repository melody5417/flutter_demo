import 'package:flutter/material.dart';
import 'package:melody_flutter_demo/State/count_model.dart';
import 'package:melody_flutter_demo/State/scoped_page_child.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
      model: new CountModel(),
      child: new Scaffold(
        appBar: AppBar(
          title: Text('scroped_page_main'),
        ),
        body:
            ScopedModelDescendant<CountModel>(builder: (context, child, model) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(model.count.toString()),
                  RaisedButton(
                    child: Text('increment'),
                    onPressed: () => model.increment(),
                  ),
                  ScopedPageForwardButton()
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ScopedPageForwardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('forward'),
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => ScopedPageChild())
        );
      },
    );
  }
}
