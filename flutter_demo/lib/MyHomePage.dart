import 'package:flutter/material.dart';
import 'package:melody_flutter_demo/Tab/bottom_tab_list.dart';
import 'package:melody_flutter_demo/Tab/top_tab.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new WYQTopTab()),
                );
              },
              child: Text("顶部tab"), color: Colors.blue),
            FlatButton(
              onPressed: (){
                Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new WYQBottomTabList())
                );
              },
              child: Text("底部tab"), color: Colors.blue)

          ],
        ),
      ),
    );
  }
}