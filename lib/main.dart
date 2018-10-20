import 'package:flutter/material.dart';
import 'package:whatsapp/chat_list_widget.dart';
import 'package:whatsapp/placeholder_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Color(0xFF075E54),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  initState() {
    _tabController = TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(child: Text("CHATS")),
            Tab(child: Text("STATUS")),
            Tab(child: Text("CALLS")),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PlaceHolderWidget(),
          ChatListWidget(),
          PlaceHolderWidget(),
          PlaceHolderWidget(),
        ],
      ),
    );
  }
}
