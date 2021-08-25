import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_farming/screens/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
  title: 'Application',
  home: SmartFarming(),
  debugShowCheckedModeBanner: false,
));
}

class SmartFarming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: LoginScreen()
        )
      );
  }

}
