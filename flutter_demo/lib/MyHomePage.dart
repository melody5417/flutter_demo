import 'package:flutter/material.dart';
import 'package:melody_flutter_demo/Route/custom_navigator_page.dart';
import 'package:melody_flutter_demo/Route/nested_navigator_page.dart';
import 'package:melody_flutter_demo/Route/route_param_page.dart';
import 'package:melody_flutter_demo/Route/route_result_page.dart';
import 'package:melody_flutter_demo/Route/route_simple_page.dart';
import 'package:melody_flutter_demo/ScrollController/scroll_limit_reached.dart';
import 'package:melody_flutter_demo/ScrollController/scroll_movement.dart';
import 'package:melody_flutter_demo/ScrollController/scroll_status.dart';
import 'package:melody_flutter_demo/State/scoped_page_main.dart';
import 'package:melody_flutter_demo/Tab/bottom_tab_list.dart';
import 'package:melody_flutter_demo/Tab/top_tab.dart';
import 'package:melody_flutter_demo/WebAndJson/json_page.dart';
import 'package:melody_flutter_demo/list/list_autoloadmore.dart';
import 'package:melody_flutter_demo/list/list_loadmore.dart';
import 'package:melody_flutter_demo/list/list_loadmore_animation.dart';
import 'package:melody_flutter_demo/list/list_refresh.dart';
import 'package:melody_flutter_demo/list/list_simple.dart';

import 'WebAndJson/dio_request_page.dart';

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
                  new MaterialPageRoute(builder: (context) => new WYQBottomTabList(
                    myTabs: <Tab>[
                      Tab(text: '简单列表'),
                      Tab(text: '刷新列表'),
                      Tab(text: '加载更多'),
                      Tab(text: '自动加载'),
                      Tab(text: '加载动画')
                    ],
                    myTabViews: <Widget>[
                      WYQTabviewList(),
                      WYQTabviewListRefresh(),
                      WYQTabviewListLoadmore(),
                      WYQTabviewListAutoLoadmore(),
                      WYQListViewLoadmoreAnimation(),
                    ],
                  )),
                );
              },
              child: Text("底部tab及list用法"), color: Colors.blue),
            FlatButton(
                onPressed: (){
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new WYQBottomTabList(
                      myTabs: <Tab>[
                        Tab(text: '顶部底部检测'),
                        Tab(text: '移动'),
                        Tab(text: '状态检测')
                      ],
                      myTabViews: <Widget>[
                        ScrollLimitReachedPage(),
                        ScrollMovermentPage(),
                        ScrollStatusPage()
                      ],
                    )),
                  );
                },
                child: Text("ScrollController详解"), color: Colors.blue),
            FlatButton(
                onPressed: (){
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new WYQBottomTabList(
                      myTabs: <Tab>[
                        Tab(text: '简单路由'),
                        Tab(text: '参数跳转'),
                        Tab(text: 'result返回'),

                        Tab(text: '嵌套路由'),
                        Tab(text: '自定义',),
                      ],
                      myTabViews: <Widget>[
                        RouteSimpleFirstPage(),
                        RouteParamListPage(),
                        RouteResultListPage(),
                        NestedNavigator(),
                        CustomNavigatorPage(),
                      ],
                    )),
                  );
                },
                child: Text("Route详解"), color: Colors.blue),
            FlatButton(
                onPressed: (){
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new WYQBottomTabList(
                      myTabs: <Tab>[
                        Tab(text: '网络请求'),
                        Tab(text: 'json'),
                      ],
                      myTabViews: <Widget>[
                        DioRequestPage(),
                        JsonPage(),
                      ],
                    )),
                  );
                },
                child: Text("网络请求及json序列化"), color: Colors.blue),
            FlatButton(
                onPressed: (){
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new WYQBottomTabList(
                      myTabs: <Tab>[
                        Tab(text: 'Scoped model'),
                      ],
                      myTabViews: <Widget>[
                        ScopedPageMain(),
                      ],
                    )),
                  );
                },
                child: Text("状态管理"), color: Colors.blue),
          ],
        ),
      ),
    );
  }
}