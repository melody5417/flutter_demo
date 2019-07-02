import 'package:flutter/material.dart';

class WYQBottomTabList extends StatefulWidget {
  List<Tab> myTabs;
  List<Widget> myTabViews;

  WYQBottomTabList({Key key, this.myTabs, this.myTabViews}) : super(key: key);

  @override
  _WYQBottomTabListState createState() => _WYQBottomTabListState();
}

class _WYQBottomTabListState extends State<WYQBottomTabList> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.myTabs.length);
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
        children: widget.myTabViews,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: widget.myTabs,
        ),
      ),
    );
  }
}
