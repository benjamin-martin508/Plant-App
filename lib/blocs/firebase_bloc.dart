import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'package:plant_app/blocs/bloc_provider.dart';
import 'package:plant_app/models/firebase_datapoint.dart';

class FirebaseBloc extends BlocBase {
  StreamSubscription<QuerySnapshot> _userPlantsStream;

//  BehaviorSubject<FirebaseDatapoint> _saveDatapointController =
//  BehaviorSubject<FirebaseDatapoint>();

  BehaviorSubject<List<DocumentSnapshot>> _userPlantController =  BehaviorSubject<List<DocumentSnapshot>>();
  Sink<List<DocumentSnapshot>> get _inUserPlant => _userPlantController.sink;
  Stream<List<DocumentSnapshot>> get outUserPlant => _userPlantController.stream;

//  Sink<FirebaseDatapoint> get inSaveDatapoint => _saveDatapointController.sink;

  StreamSubscription<DocumentSnapshot> _userDataStream;

  final FirebaseAuth fbAuth = FirebaseAuth.instance;
  FirebaseUser currentUser;


  FirebaseBloc() {
    fbAuth.onAuthStateChanged.listen((data) {
      currentUser = data;
      if (currentUser != null) {
        _handleNewUser();
      } else {
        _userPlantsStream?.cancel();
      }
    });
//    _saveDatapointController.listen(_sendToFirebase);
  }

  @override
  void dispose() {
    try {
      _userDataStream?.cancel();
      _userPlantController?.close();
    } catch (exception) {
      print(exception.toString());
    }
  }

  _handleNewUser() {
    _userPlantsStream = Firestore.instance.collection('plants').where('owner', isEqualTo: 'Ben').snapshots().listen((doc) {
      if(doc.documents != null) {
        _inUserPlant.add(doc.documents);
      }
    });
  }
  
//  _sendToFirebase(FirebaseDatapoint fbData) async {
//      Firestore.instance
//          .collection('devices')
//          .document(macAddress.toString())
//          .get()
//          .then((snapshot) => snapshot.reference
//          .collection('data')
//          .document()
//          .setData({
//        "timestamp"  : fbData.timestamp,
//        "chargeState": fbData.chargeState,
//        "batteryVolt": fbData.batteryVolt,
//        "batteryAmps": fbData.batteryAmp,
//        "panelVolt": fbData.panelVolt,
//        "panelAmps": fbData.panelAmp
//      }));
//  }

}