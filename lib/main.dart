import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:plant_app/blocs/bloc_provider.dart';
import 'package:plant_app/blocs/firebase_bloc.dart';
import 'package:plant_app/screens/login_screen.dart';

void main() {
  FirebaseBloc fbBloc = FirebaseBloc();
//  debugPaintSizeEnabled = true;
  runApp(BlocProvider<FirebaseBloc>(
      bloc: fbBloc,
      child: PlantApp()));
}

class PlantApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FirebaseBloc fbBloc = BlocProvider.of<FirebaseBloc>(context);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        canvasColor: Colors.white,
//
      ),
      home: handleLoginScreen(fbBloc),
    );
  }
}
