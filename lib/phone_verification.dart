import 'package:flutter/material.dart';

class PhoneVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Farming'), backgroundColor: Colors.green[900]),
          body: Container(
            margin: EdgeInsets.only(left: 25.0, right: 25.0 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the verification code sent to you', style: TextStyle(fontSize: 22.0),),SizedBox(height: 40.0,),
            TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Verification Code",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.green), borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.blue), borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
