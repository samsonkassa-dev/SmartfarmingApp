// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:smart_farming/models/data_api.dart';

// class SensorDataProvider extends StatefulWidget {
//   @override
//   _SensorDataProviderState createState() => _SensorDataProviderState();
// }

// class _SensorDataProviderState extends State<SensorDataProvider> {
//   const url =
//       "https://api.thingspeak.com/channels/1476026/fields/1.json?api_key=Y86I2FMYYUQQ7O7Z&results=2";

//   // Future<List<DataModelApi>> getData() async {
//   //   final response = await http.get(Uri.parse(url));
//   //   if (response.statusCode == 200) {
//   //     //final dataModelApi = jsonDecode(response.body) as List;
//   //     //dataModelApi = DataModelApi.fromJson(jsonDecode(response.body));
//   //     final dataModelApi = jsonDecode(response.body);
//   //     //print(dataModelApi.feeds[1].field1);
//   //     //print("Successfully fetched and parsed Sensor Data");

//   //     //return dataModelApi.map((e) => DataModelApi.fromJson(e)).toList();
//   //     //return dataModelApi.map((place) => DataModelApi.fromJson(place)).toList();
//   //     return dataModelApi.map((data) => DataModelApi.fromJson(data));
//   //     //return dataModelApi;
//   //   } else {
//   //     //print(response.body);
//   //     throw Exception('Failed to load the data');
//   //   }
//   // }

//   var isLoading = false;
//   DataModelApi dataModelApi;

//   _fetchData() async {
//     //Async function which handels Json parsing
//     setState(() {
//       isLoading = true;
//     });
//     final response = await http.get(
//         'https://api.thingspeak.com/channels/632047/feeds.json?api_key=4RHC9RUU7PA4X3D8&results=1');

//     @override
//     Widget build(BuildContext context) {
//       return Container();
//     }
//   }
// }
