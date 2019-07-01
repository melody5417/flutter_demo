import 'package:flutter/material.dart';

class WYQTabviewListRefresh extends StatefulWidget {
  @override
  _WYQTabviewListRefreshState createState() => _WYQTabviewListRefreshState();
}

class _WYQTabviewListRefreshState extends State<WYQTabviewListRefresh> {
  List<int> list = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new RefreshIndicator(
          child: new ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return new Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        child: Text('${list[index]}'),
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                    new Divider()
                  ],
                );
              }),
          onRefresh: _doRefresh),
    );
  }

  Future<void> _doRefresh() async {
    await Future<Null>.delayed(Duration(seconds: 3), () {
      setState(() {
        list.addAll(List.generate(3, (int index) => index * index));
      });
    });
  }
}
