import 'package:flutter/material.dart';
import 'package:smart_farming/dataprovider/sensor_dataprovider.dart';
import 'package:smart_farming/models/data_api.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //fetchData();
    provider.GetData();

    DataModelApi dataModelApi = new DataModelApi(channel: channel, feeds: feeds)
    super.initState();
  }

  SensorDataProvider provider = new SensorDataProvider();

  void a() {
    provider.GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: a,
          child: Text("click"),
        ),
        Text("hi")
      ],
    );
  }
}
