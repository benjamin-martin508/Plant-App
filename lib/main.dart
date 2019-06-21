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
      home: PlantPage(title: 'PlantMonitor'),
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
  var plants = ['betty', 'sallly', 'marvin'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[600],
      ),
      drawer: Drawer(
          child: ListView.separated(
              itemCount: plants.length,
              separatorBuilder: (context, position) => Divider(),
              itemBuilder: (context, position) {
                return ListTile(
                    title: Text(plants[position]),
                    onTap: () => Navigator.pop(context));
              })),
      body: Center(child:Container(width:MediaQuery.of(context).size.width*.4,decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/tree_planting.v2.png',),fit: BoxFit.scaleDown)),)),
    );
  }
}
