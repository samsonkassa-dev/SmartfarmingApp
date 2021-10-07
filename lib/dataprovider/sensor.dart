import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_farming/models/channel.dart';
import 'package:smart_farming/models/channels.dart';
import 'package:smart_farming/models/data_api.dart';
import 'package:http/http.dart' as http;
import 'package:smart_farming/screens/pump_control.dart';
import 'package:weather_icons/weather_icons.dart';

class SensorDataProvider extends StatefulWidget {
  @override
  _SensorDataProviderState createState() => _SensorDataProviderState();
}

class _SensorDataProviderState extends State<SensorDataProvider> {
  late StreamController streamController;

  GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();

  String url = 'http://192.168.43.224:4000/channel/Newchannel2';

  bool isLoading = false;
  late DataModelApi dataModelApi;
  late Channels channels;

  Future fetchData() async {
    //Async function which handels Json parsing
    setState(() {
      isLoading = true;
    });
    print("test");
    final response = await http.get(Uri.parse(url));
    setState(() {
      isLoading = false;
    });
    print(response);
    List data = [];
    if (response.statusCode == 200) {
      //final r = jsonDecode(response.body);
      channels = Channels.fromJson(jsonDecode(response.body));
      List x = [];
      List v = [];
      //x.add();
      // to be setted
      // channels.field1[channels.field1.length - 1]["val"]);
      //Map f2 = channels.field1[channels.field1.length - 1];
      //Map f3 = channels.field1[channels.field1.length - 1];

      //print(xx.);

      //.map((e) => {v.add(e.val)});
      //print(xx);

      //print(r);
    }

    return channels;
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
        title: Text("Test"),
      ),
      // body: Container(
      //   child: TextButton(
      //     child: Text("test"),
      //     onPressed: () {
      //       fetchData();
      //     },
      //   ),
      // ),
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
                      '${snapshot.data.field1[channels.field1.length - 1]["val"]}°C'
                          .toString(),
                      Icon(
                        WeatherIcons.thermometer,
                        color: Colors.red[900],
                        size: 35.0,
                      ),
                      'Temprature'),
                  cards(
                      //'',
                      '${snapshot.data.field3[channels.field3.length - 1]["val"]}'
                          .toString(),
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
      // ),
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
