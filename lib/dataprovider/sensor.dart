import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_farming/models/data_api.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';

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

  Future<DataModelApi> fetchData() async {
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
      dataModelApi = DataModelApi.fromJson(jsonDecode(response.body));
      print(dataModelApi.feeds[0].field1);
    }
    return dataModelApi;
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
    Timer.periodic(Duration(seconds: 10), (_) => loadData());

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
        builder: (context, AsyncSnapshot snapshot) {
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
              return Column(
                children: [
                  cards(
                      '${snapshot.data.feeds[0].field1}°C'.toString(),
                      Icon(
                        WeatherIcons.thermometer,
                        color: Colors.red[900],
                        size: 35.0,
                      ),
                      'Temprature'),
                  cards(
                    'test',
                      //'${snapshot.data.feeds[0].field2}'.toString(),
                      Icon(
                        WeatherIcons.humidity,
                        color: Colors.red[900],
                        size: 35.0,
                      ),
                      'Humidity'),
                ],
              );

              // Center(
              //   child: Text(
              //       //"Active",
              //       snapshot.data == null
              //           ? 'Null'
              //           : snapshot.data.feeds[0].field1
              //       //style: Theme.of(context).textTheme.display1,
              //       ),
              // );
              break;
            case ConnectionState.done:
              print('Done is fucking here ${snapshot.data}');
              if (snapshot.hasData) {
                return Center(
                  child: Text(
                    "TEstata",

                    //snapshot.data.fname == null ? 'Null' : snapshot.data.fname,
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

  Widget cards(String data, Widget wi, String dataname) {
    return Card(
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
                    wi,
                    
                    SizedBox(width: 10),
                    Text(
                      dataname,
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
              data,
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
    );
  }
}
