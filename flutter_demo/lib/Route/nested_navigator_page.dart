// 参考： https://api.flutter.dev/flutter/widgets/Navigator-class.html
// demonstrate how a nested navigator can be used
// to present a standalone user registration journey.
// 嵌套路由 一个app中可以有多个导航器 将一个导航器嵌套在另一个
// 导航器下面可以创建一个内部的路由历史。

import 'package:flutter/material.dart';

class NestedNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Navigator(
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'home':
            builder = (BuildContext context) => new NestedHomePage();
            break;
          case 'NestedChild':
            builder = (BuildContext context) => new NestedChildPage();
            break;
          default:
            throw new Exception("Invalid route: ${settings.name}");
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class NestedHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("home"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("go to NestedChild page"),
          onPressed: () {
            // 点击跳转到child页面后，底部tab栏并没有消失。
            // 因为这是在子导航器中进行的跳转。
            Navigator.of(context).pushNamed("NestedChild");
          },
        )

      ),
    );
  }
}

class NestedChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NestedChild"),
      ),
      body: new Center(
          child: new RaisedButton(
            child: new Text("go to ModalChild page"),
            onPressed: () {
              // 点击跳转到 /modalchild 页面后，会跳转到全屏的page。
              // 需要在 root navigator 的 routes里添加
              Navigator.of(context, rootNavigator: true).pushNamed("/modalchild");
            },
          )

      ),
    );
  }
}

class ModalChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ModalChild"),
      ),
      body: new Center(
          child: new Text("ModalChild"),
      ),
    );
  }
}


