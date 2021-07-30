import 'package:flutter/material.dart';
import 'package:smart_farming/screens/dashboard.dart';

class PhoneVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Smart Farming'), backgroundColor: Colors.green[900]),
      body: Container(
        margin: EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verification Code Sent',
              style: TextStyle(color: Colors.green[900], fontSize: 24.0),
            ),
            Text(
              'Enter the verification code sent to you',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_callback),
                labelText: "Verification Code",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    InkWell(
                        child: Text(' RESEND',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 17.0))),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 200.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green[900]),
                )),
          ],
        ),
      ),
    );
  }
}
