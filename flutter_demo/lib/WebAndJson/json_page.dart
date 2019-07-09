import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:melody_flutter_demo/WebAndJson/json_model.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio request"),
      ),
      body: Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('assets/json_model.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              final response = snapshot.data.toString();
              final parsed = json.decode(response);
              final entity = Entity.fromJson(parsed);
              final data = entity.data;
              final datas = data.datas;

              return new ListView.builder(
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("author: " + datas[index].author),
                        new Text("chapterName: " + datas[index].chapterName)
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
