import 'package:flutter/material.dart';

class WYQTabviewListAutoLoadmore extends StatefulWidget {
  @override
  _WYQTabviewListAutoLoadmoreState createState() => _WYQTabviewListAutoLoadmoreState();
}

class _WYQTabviewListAutoLoadmoreState extends State<WYQTabviewListAutoLoadmore> with AutomaticKeepAliveClientMixin {
  List<int> list = [];

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: _scrollInfoNotification,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${list[index]}'),
              );
            },
          ),
        )
    );
  }

  bool _scrollInfoNotification(ScrollNotification scrollInfo) {
    // 下滑到最底部
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      _loadMore();
    }
    return true;
  }

  Future<void> _loadMore() async {
    await Future<Null>.delayed(Duration(seconds: 3), () {
    setState(() {
    list.addAll(List.generate(10, (int index) => index + index * index));
    });
    });
  }

  @override
  bool get wantKeepAlive => true;
}

