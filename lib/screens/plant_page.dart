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

  @override
  Widget build(BuildContext context) {
    final FirebaseBloc fbBloc = BlocProvider.of<FirebaseBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: widget.plantname == null
              ? Text('Plant Monitor', style: TextStyle(color: Colors.white))
              : Text(widget.plantname, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey[600],
        ),
        drawer: Drawer(
            child: StreamBuilder(
              stream: fbBloc.outUserPlant,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("No Plants");
                } else {
                  return ListView.separated(
                      itemCount: snapshot.data.length,
                      separatorBuilder: (context, position) => Divider(),
                      itemBuilder: (context, position) {
                        return ListTile(
                            title: Text(snapshot.data[position]['name']),
                            onTap: () {
                              setState(() {
                                widget.plantname = snapshot.data[position]['name'];
                              });
                              Navigator.pop(context);
                            });
                      });
                }
              },
            )),
        body: widget.plantname != null ? buildnamedplant() : buildnoplant());
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(radius: 70, backgroundColor: Colors.amber,backgroundImage:AssetImage(
                  'assets/tree_planting.v2.png'),),
              Text(widget.plantname),
              Text('Pothos "Apepremnum Aureum"')
            ]
        )
    );
  }
}