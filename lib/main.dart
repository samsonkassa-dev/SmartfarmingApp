//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:smart_farming/screens/sensor_screen.dart';
//import 'package:smart_farming/screens/login.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Application',
    home: SensorScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SmartFarming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text("test")));
  }
}
