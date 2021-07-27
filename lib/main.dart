import 'package:flutter/material.dart';

main() => runApp(SmartFarming());

class SmartFarming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: ListView(
              children: [
                Image.asset(
                  'assets/logoo.png',
                  height: 380.0,
                  width: 450.0,
                ),
                Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30.0, color: Colors.green[900]),
                ),
                Text(
                  'Sign in using your phone number',
                  style: TextStyle(fontSize: 17.0, color: Colors.green[600]),
                ),
                Container(
                  width: 10.0,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 15.0, bottom: 5.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Next'),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            primary: Colors.green[800]))),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                      child: Text(
                    'Sign in using email',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
