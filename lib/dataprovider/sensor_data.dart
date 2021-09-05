import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_farming/models/data_api.dart';
import 'package:smart_farming/screens/pump_control.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  late Future future;
  late DataModelApi dataModelApi;
  String url =
      "https://api.thingspeak.com/channels/1476026/fields/1.json?api_key=Y86I2FMYYUQQ7O7Z&results=1";

  Future fetchData() async {
    //Async function which handels Json parsing

    final response = await http.get(Uri.parse(url));

    print("test");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.

      dataModelApi = new DataModelApi.fromJson(jsonDecode(response.body));
      print("Successfully fetched and parsed Sensor Data");

      //Temperature

    }
  }

  Future getdata() async {
    final resp = await http.get(Uri.parse(url));

    dataModelApi = DataModelApi.fromJson(jsonDecode(resp.body));
    return dataModelApi.feeds[0].field1;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  navigateToController() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return PumpController();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
                onPressed: navigateToController, 
                icon: Icon(Icons.agriculture)),
          )
        ],
        title: Text("TEST"),
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            print("yayyyyyyyyyyyyyyyyyyyyyyyyyyy");
            print(snapshot.data);
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
