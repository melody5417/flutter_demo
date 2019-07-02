import 'package:flutter/material.dart';

class WYQListViewLoadmoreAnimation extends StatefulWidget {
  @override
  _WYQListViewLoadmoreAnimationState createState() => _WYQListViewLoadmoreAnimationState();
}

class _WYQListViewLoadmoreAnimationState extends State<WYQListViewLoadmoreAnimation> with AutomaticKeepAliveClientMixin {
  List<int> list = [1, 2, 3];

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: _scrollInfoNotification,
          child: ListView.builder(
            itemCount: isLoading ? list.length + 1 : list.length,
            itemBuilder: (context, index) {
              if (isLoading && index == list.length) {
                return _buildProgressIndicator();
              }
              return ListTile(
                title: Text('${list[index]}'),
              );
            },
          ),
        )
    );
  }

  bool _scrollInfoNotification(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollEndNotification) {
      // 下滑到最底部
      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
        _loadMore();
      }
    }
    return true;
  }

  Future<void> _loadMore() async {
    setState(() {
      isLoading = true;
    });
    await Future<Null>.delayed(Duration(seconds: 2), () {
      setState(() {
        list.addAll(List.generate(3, (int index) => index + index * index));
        isLoading = false;
      });
    });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text('Loading'),
          ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


