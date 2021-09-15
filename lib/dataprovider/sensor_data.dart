import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_farming/models/data_api.dart';
import 'package:smart_farming/screens/pump_control.dart';
import 'package:weather_icons/weather_icons.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  String text = "";
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

  Future<String> getdata() async {
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
    Timer.periodic(Duration(seconds: 1), (callback) => getdata());
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
                onPressed: navigateToController, icon: Icon(Icons.agriculture)),
          )
        ],
        title: Text("TEST"),
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            print(snapshot.data);
            print("yayyyyyyyyyyyyyyyyyyyyyyyyyyy");
            print(snapshot.data);
            children = <Widget>[
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Icon(
                                WeatherIcons.thermometer,
                                color: Colors.red[900],
                                size: 35.0,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Temperature',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Indicator',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Text(
                        '$text°C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 100,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // const Icon(
              //   Icons.check_circle_outline,
              //   color: Colors.green,
              //   size: 60,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 16),
              //   child: Text('Result: ${snapshot.data}'),
              // )
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
