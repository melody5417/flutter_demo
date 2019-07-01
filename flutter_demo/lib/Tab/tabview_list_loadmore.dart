import 'package:flutter/material.dart';

class WYQTabviewListLoadmore extends StatefulWidget {
  @override
  _WYQTabviewListLoadmoreState createState() => _WYQTabviewListLoadmoreState();
}

class _WYQTabviewListLoadmoreState extends State<WYQTabviewListLoadmore> with AutomaticKeepAliveClientMixin {
  List<int> list = [];

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          return (index == list.length) ?
          Container(
            color: Colors.green,
            child: FlatButton(onPressed: () {
              _loadMore();
            }, child: Text("Load more")),
          )
              :
          ListTile(
            title: Text('${list[index]}'),
          );
        },
      )
    );
  }

  Future<void> _loadMore() async {
    await Future<Null>.delayed(Duration(seconds: 3), () {
      setState(() {
        list.addAll(List.generate(5, (int index) => index + index * index));
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}

