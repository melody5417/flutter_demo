import 'package:flutter/material.dart';
import 'package:melody_flutter_demo/Tab/tabview_list.dart';
import 'package:melody_flutter_demo/Tab/tabview_list_refresh.dart';

class WYQBottomTabList extends StatefulWidget {
  @override
  _WYQBottomTabListState createState() => _WYQBottomTabListState();
}

class _WYQBottomTabListState extends State<WYQBottomTabList> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '简单列表'),
    Tab(text: '带刷新列表'),
  ];

  TabController _tabController;

  _tabViews() {
    return [ WYQTabviewList(), WYQTabviewListRefresh()];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("底部tab"),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabViews(),
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
    );
  }
}
