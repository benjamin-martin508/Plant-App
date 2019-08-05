import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:plant_app/blocs/firebase_bloc.dart';
import 'package:plant_app/screens/plant_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Widget handleLoginScreen(FirebaseBloc fbBloc) {
  return new StreamBuilder<FirebaseUser>(
      stream: fbBloc.fbAuth.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          print(snapshot.data);
          if (snapshot.hasData) {
            return PlantPage(plantname: null,);
          }
          return LoginScreen();
        }
      });
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/tree_planting.v2.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
        child: CircularProgressIndicator(),
      )
    ]);
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _logData = true;
  void _logDataStateChanged(bool value) => setState(() => _logData = value);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/tree_planting.v2.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * .5,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .15),
                child: Material(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.05),
                          onPressed: () async {
                            _auth.signInAnonymously();
                          },
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('CONTINUE')),
                        ),
                      ],
                    ))),
          ))
    ]);
  }
}