import 'package:flutter/material.dart';

class WYQTabviewList extends StatefulWidget {
  @override
  _WYQTabviewListState createState() => _WYQTabviewListState();
}

class _WYQTabviewListState extends State<WYQTabviewList> with AutomaticKeepAliveClientMixin {
  final List<String> _contents = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "11",
    "22",
    "33",
    "44",
    "55",
    "66",
    "77",
    "88",
    "99",
    "00",
    "111",
    "222",
    "333",
    "444",
    "555",
    "666",
    "777",
    "888",
    "999",
    "000"
  ];

  _buildRows(String pair) {
    return new ListTile(
      title: new Text(pair),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: _contents.length * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          return _buildRows(_contents[index]);
        }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
