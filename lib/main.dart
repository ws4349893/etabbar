import 'package:etabbar/etab.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ETabBarDemo(),
    );
  }
}

class ETabBarDemo extends StatefulWidget {
  @override
  _ETabBarDemoState createState() => _ETabBarDemoState();
}

class _ETabBarDemoState extends State<ETabBarDemo> {
  int len = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: DefaultTabController(
        child: Column(
          children: <Widget>[
            ETabBar(
              isScrollable: true,
              labelColor: Colors.red,
              labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 14),
              tabs: <Widget>[
                for (int i = 0; i < len; i++) ETab(child: Text("测试 $i")),
              ],
            ),
            Expanded(
                child: TabBarView(
              children: <Widget>[
                for (int i = 0; i < len; i++)
                  Container(
                    child: Center(
                      child: Text("view$i"),
                    ),
                  ),
              ],
            ))
          ],
        ),
        length: len,
      ),
    );
  }
}
