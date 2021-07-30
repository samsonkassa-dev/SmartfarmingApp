import 'package:flutter/material.dart';
import 'package:smart_farming/screens/cards.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Farming'
        ),
        backgroundColor: Colors.green[900],
      ),
      body: Cards(),
      
    );
  }
}