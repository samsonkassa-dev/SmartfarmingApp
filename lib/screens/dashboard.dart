import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Smart Farming'),
          backgroundColor: Colors.green[900],
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: ListView(
            children: [
              SizedBox(
                height: 200.0,
                  child: Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.thermostat,
                        color: Color(0xffd00000),
                        size: 40.0,
                      ),
                      Text(
                        'Temperature',
                        style: TextStyle(fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 200.0,
                  child: Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        WeatherIcons.humidity,
                        color: Color(0xff0466c8),
                        size: 40.0,
                      ),
                      Text(
                        'Humidity',
                        style: TextStyle(fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
                  child: Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        WeatherIcons.raindrop,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                      Text(
                        'Moisture',
                        style: TextStyle(fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
