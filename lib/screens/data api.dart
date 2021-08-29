// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:smart_farming/models/data_api.dart';

// class Thingspeak extends StatefulWidget {
//   @override
//   _ThingspeakState createState() => _ThingspeakState();
// }

// class _ThingspeakState extends State<Thingspeak> {
//   @override
//   Widget build(BuildContext context) {
//     //fetchData();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DashBoard"),
//       ),
//       body: RaisedButton(
//         onPressed: fetchData,
//         child: Text("Test"),
//       ),
//     );
//   }

//   Future<ThingspeakModel> fetchData() async {
//     var res = await http.get(
//       Uri.parse(
//           "https://api.thingspeak.com/channels/1476026/fields/1.json?api_key=Y86I2FMYYUQQ7O7Z&results=2"),
//     );

//     //print(res.body);
//     //List<String> l;

//     //final s = jsonDecode(res.body) as List;
//     //print(s[0]);
//     print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
//     return ThingspeakModel.fromJson(jsonDecode(res.body));
//   }
// }
