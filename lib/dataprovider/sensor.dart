import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_farming/models/data_api.dart';
import 'package:http/http.dart' as http;
import 'package:smart_farming/screens/card.dart';

class SensorDataProvider extends StatefulWidget {
  @override
  _SensorDataProviderState createState() => _SensorDataProviderState();
}

class _SensorDataProviderState extends State<SensorDataProvider> {
  late StreamController streamController;

  GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();

  String url =
      "https://api.thingspeak.com/channels/1476026/fields/1.json?api_key=Y86I2FMYYUQQ7O7Z&results=1";

  bool isLoading = false;
  late DataModelApi dataModelApi;

  Future fetchData() async {
    //Async function which handels Json parsing
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(url));
    setState(() {
      isLoading = false;
    });
    print("test");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.

      dataModelApi = new DataModelApi.fromJson(jsonDecode(response.body));
      print("Successfully fetched and parsed Sensor Data");

      //Temperature

      if (double.parse(dataModelApi.feeds[0].field1).toInt() >= 18 &&
          double.parse(dataModelApi.feeds[0].field1).toInt() < 24) {
        var str = {
          'icon': 'assets/temperature.png',
          'name': 'Temperature',
          'value': '${double.parse(dataModelApi.feeds[0].field1).toInt()}°C',
          'subText': 'Normal',
          'color': '${normalTemp}',
          'subColor': '${normalText}',
        };
        coins.add(str);
      } else if (double.parse(dataModelApi.feeds[0].field1).toInt() >= 24 &&
          double.parse(dataModelApi.feeds[0].field3).toInt() <= 28) {
        var str = {
          'icon': 'assets/temperature.png',
          'name': 'Temperature',
          'value': '${double.parse(dataModelApi.feeds[0].field1).toInt()}°C',
          'subText': 'Moderate',
          'color': '${moderateTemp}',
          'subColor': '${moderateText}',
        };
        coins.add(str);
      } else if (double.parse(dataModelApi.feeds[0].field1).toInt() > 28) {
        var str = {
          'icon': 'assets/temperature.png',
          'name': 'Temperature',
          'value': '${double.parse(dataModelApi.feeds[0].field1).toInt()}°C',
          'subText': 'Critical',
          'color': '${highTemp}',
          'subColor': '${highText}',
        };
        coins.add(str);
      }
    }
  }

  //update data automatically
  loadData() async {
    fetchData().then((res) async {
      streamController.add(res);
      return res;
    });
  }

  @override
  void initState() {
    streamController = new StreamController();

    //loadData();

    //_userController = new StreamController();
    //Timer.periodic(Duration(seconds: 1), (_) => loadData());

    // TODO: implement initState
    // fetchData().whenComplete(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: StreamBuilder(
        stream: streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('None'),
              );
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              return Center(
                child: Text(
                  "Active",
                  //snapshot.data.f == null ? 'Null' : snapshot.data.fname,
                  //style: Theme.of(context).textTheme.display1,
                ),
              );
              break;
            case ConnectionState.done:
              print('Done is fucking here ${snapshot.data}');
              if (snapshot.hasData) {
                return Center(
                  child: Text(
                    snapshot.data.fname == null ? 'Null' : snapshot.data.fname,
                    style: Theme.of(context).textTheme.display1,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Has Error');
              } else {
                return Text('Error');
              }
              break;
          }
          return Text('Non in Switch');
        },
      ),
      //),
      // stream: streamController.stream,
      // builder: (
      //   BuildContext context,
      //   AsyncSnapshot snapshot,
      // ) {
      //   print('Has error: ${snapshot.hasError}');
      //   print('Has data: ${snapshot.hasData}');
      //   print('Snapshot Data ${snapshot.data}');

      //   if (snapshot.hasError) {
      //     return Text(snapshot.error.toString());
      //   }

      //   if (snapshot.hasData) {
      //     return Column(
      //       children: [
      //         isLoading == false
      //             ? Card(
      //                 child: Text(
      //                     '${double.parse(dataModelApi.feeds[0].field1).toInt()}°C'),
      //               )
      //             : Container(
      //                 child: Center(
      //                   child: Text("Loading"),
      //                 ),
      //               ),
      //       ],
      //     );
      //   }
      //   if (snapshot.connectionState != ConnectionState.done) {
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      //   if (!snapshot.hasData &&
      //       snapshot.connectionState == ConnectionState.done) {
      //     return Text('No Posts');
      //   }
      //   return Text("Sreambuilder Not Working");
      // }),

      // isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         physics: NeverScrollableScrollPhysics(),
      //         primary: false,
      //         itemCount: coins.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           Map coin = coins[index];

      //           return Cards(
      //             name: coin['name'],
      //             icon: coin['icon'],
      //             value: coin['value'],
      //             color: coin['color'],
      //             subColor: coin['subColor'],
      //             subText: coin['subText'],
      //           );
      //         },
      //       ),
    );
  }
}
