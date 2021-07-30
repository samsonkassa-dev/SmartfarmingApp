import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:smart_farming/screens/phone_verification.dart';
main() => runApp(MaterialApp(
  title: 'App',
  home: SmartFarming(),
));

class SmartFarming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: ListView(
              children: [
                Image(
                  image: AssetImage('assets/logoo1.png'),
                  fit: BoxFit.fitHeight,
                  height: 300.0,
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
                      width: 250.0,
                      margin: EdgeInsets.only(top: 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Phone Number",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.green), borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.blue), borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                
                Container(
                    margin: EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 15.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneVerification()));
                        },
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
                  child: TextButton(
                      onPressed: () { },
                      child: Text(
                    'Sign in using email',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  )),
                ),
              ],
            ),
          ),
        ),
      );
  }

}
