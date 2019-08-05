import 'package:flutter/material.dart';
import 'package:plant_app/blocs/bloc_provider.dart';
import 'package:plant_app/blocs/firebase_bloc.dart';

class PlantPage extends StatefulWidget {
  PlantPage({Key key, this.plantname}) : super(key: key);
  String plantname;
  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  var plants = ['betty', 'sallly', 'marvin'];
  var isedit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.plantname == null
              ? Text('Plant Monitor', style: TextStyle(color: Colors.white))
              : Text(widget.plantname, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey[600],
          actions: <Widget>[buildactions()],
        ),
        drawer: Drawer(
            child: ListView.separated(
                itemCount: plants.length,
                separatorBuilder: (context, position) => Divider(),
                itemBuilder: (context, position) {
                  return ListTile(
                      title: Text(plants[position]),
                      onTap: () {
                        setState(() {
                          widget.plantname = plants[position];
                        });
                        Navigator.pop(context);
                      });
                })),
        body: widget.plantname != null
            ? isedit ? buildeditplant() : buildnamedplant()
            : buildnoplant());
  }

  buildactions() {
    if (isedit) {
      return IconButton(
          icon: Icon(Icons.done, color: Colors.white),
          onPressed: () => setState(() {
            isedit = false;
          }));
    } else {
      return IconButton(
          icon: Icon(Icons.edit, color: Colors.white),
          onPressed: () => setState(() {
            isedit = true;
          }));
    }
  }

  buildnoplant() {
    return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/tree_planting.v2.png',
                  ),
                  fit: BoxFit.scaleDown)),
        ));
  }

  buildnamedplant() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/tree_planting.v2.png'),
              ),
              Text(widget.plantname),
              Text("hjkbkb")
            ]));
  }

  buildeditplant() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/tree_planting.v2.png'),
              ),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: (widget.plantname),
                ),onSubmitted: (v) => setState((){widget.plantname= v;}),),
              Text("edit")
            ]));
  }
}