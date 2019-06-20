import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        canvasColor: Colors.white,
//
      ),
      home: PlantPage(title: 'Plant App'),
    );
  }
}

class PlantPage extends StatefulWidget {
  PlantPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style:TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[600],
      ),
      drawer: Drawer(child: ListView(children: <Widget>[
        ListTile(title: Text("Add")),
        ListTile(title: Text("Add"))
      ],)),
    );
  }
}
