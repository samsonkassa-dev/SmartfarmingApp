//import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_farming/dataprovider/sensor.dart';
import 'package:smart_farming/dataprovider/sensor_data.dart';
import 'package:smart_farming/models/data_api.dart';

import 'package:smart_farming/screens/sensor_screen.dart';
//import 'package:smart_farming/screens/login.dart';
import 'package:http/http.dart' as http;

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
  void test() {
    const url =
        "https://api.thingspeak.com/channels/1476026/fields/1.json?api_key=Y86I2FMYYUQQ7O7Z&results=2";

    Future<List<DataModelApi>> getData() async {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dataModelApi = jsonDecode(response.body);
        print("Successfully fetched and parsed Sensor Data");
        print(dataModelApi.feeds[1].field1);
        //print(dataModelApi)

        return dataModelApi.map((place) => DataModelApi.fromJson(place));
      } else {
        //print(response.body);
        throw Exception('Failed to load the data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //return Scaffold(body: SafeArea(child: Text("test")));
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: TextButton(
          child: Text(""),
          onPressed: test,
        ),
      ),
    );
  }
}
