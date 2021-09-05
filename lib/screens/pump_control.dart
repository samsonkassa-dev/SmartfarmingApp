import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PumpController extends StatefulWidget {
  @override
  _PumpControllerState createState() => _PumpControllerState();
}

class _PumpControllerState extends State<PumpController> {
  String onurl =
      "https://api.thingspeak.com/update?api_key=9SO5VUH8S9EYIE04&field1=1";
  String offurl =
      "https://api.thingspeak.com/update?api_key=9SO5VUH8S9EYIE04&field1=0";

  turnOnPump() async {
    final response = await http.get(Uri.parse(onurl));

    if (response.statusCode == 200) {
    } else {}
  }

  turnOffPump() async {
    final response = await http.get(Uri.parse(offurl));
    if (response.statusCode == 200) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controller"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: turnOnPump,
                child: Row(
                  children: [
                    Icon(Icons.water_damage),
                    Text("Turn On Pump"),
                  ],
                )),
            TextButton(
                onPressed: turnOffPump,
                child: Row(
                  children: [
                    Icon(Icons.water_damage_outlined),
                    Text("Turn Off Pump"),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
