// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:smart_farming/screens/dashboard.dart';
// import 'package:smart_farming/screens/phone_verification.dart';

// enum MobileVerficationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//   MobileVerficationState currentState =
//       MobileVerficationState.SHOW_MOBILE_FORM_STATE;

//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();

//   FirebaseAuth _auth = FirebaseAuth.instance;
//   String verificationId = "";
//   String userInput = "";
//   bool showLoading = false;

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });
//     try {
//       final authCredential =
//           await _auth.signInWithCredential(phoneAuthCredential);
//       setState(() {
//         showLoading = false;
//       });
//       if (authCredential.user != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Dashboard()));
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });
//       print(e.message);
//     }
//   }

  getMobileFormWidget(context) {
    return ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
              //controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: "Phone Number",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    // String phone_number = "+251" + phoneController.text;
                    // setState(() {
                    //   showLoading = true;
                    // });
                    // await _auth.verifyPhoneNumber(
                    //     phoneNumber: phone_number,
                    //     verificationCompleted: (phoneAuthCredential) async {
                    //       setState(() {
                    //         showLoading = false;
                    //       });
                    //       // signInWithPhoneAuthCredential(phoneAuthCredential);
                    //     },
                    //     verificationFailed: (verificationFailed) async {
                    //       setState(() {
                    //         showLoading = false;
                    //       });
                    //       print(verificationFailed.message);
                    //     },
                    //     codeSent: (verificationId, resendingToken) async {
                    //       setState(() {
                    //         showLoading = false;
                    //         currentState =
                    //             MobileVerficationState.SHOW_OTP_FORM_STATE;
                    //         this.verificationId = verificationId;
                    //       });
                    //     },
                    //     codeAutoRetrievalTimeout: (verificationId) async {});
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
                onPressed: () {},
                child: Text(
                  'Sign in using email',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue),
                )),
          )
        ]);
  }

//   otpTextFields(context) {
//     final node = FocusScope.of(context);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//             width: 50.0,
//             child: TextFormField(
//               controller: otpController,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26.0),
//               onChanged: (value) {
//                 if (value.length == 1) node.nextFocus();
//                 userInput = userInput + value.toString();
//               },
//               maxLength: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   counterText: "",
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black))),
//             )),
//         SizedBox(
//             width: 50.0,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26.0),
//               onChanged: (value) {
//                 if (value.length == 1) node.nextFocus();
//                 userInput = userInput + value.toString();
//               },
//               maxLength: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   counterText: "",
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black))),
//             )),
//         SizedBox(
//             width: 50.0,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26.0),
//               onChanged: (value) {
//                 if (value.length == 1) node.nextFocus();
//                 userInput = userInput + value.toString();
//               },
//               maxLength: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   counterText: "",
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black))),
//             )),
//         SizedBox(
//             width: 50.0,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26.0),
//               onChanged: (value) {
//                 if (value.length == 1) node.nextFocus();
//                 userInput = userInput + value.toString();
//               },
//               maxLength: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   counterText: "",
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black))),
//             )),
//         SizedBox(
//             width: 50.0,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26.0),
//               onChanged: (value) {
//                 if (value.length == 1) node.nextFocus();
//                 userInput = userInput + value.toString();
//               },
//               maxLength: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   counterText: "",
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black))),
//             )),
//         SizedBox(
//             width: 50.0,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 26.0),
//               onChanged: (value) {
//                 if (value.length == 1) node.nextFocus();
//                 userInput = userInput + value.toString();
//               },
//               maxLength: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   counterText: "",
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black))),
//             )),
//       ],
//     );
//   }

//   getOtpFormWidget(context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('OTP Verification'), backgroundColor: Colors.green[900]),
//       body: Container(
//         margin: EdgeInsets.only(left: 25.0, right: 25.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Verification Code Sent',
//               style: TextStyle(color: Colors.green[900], fontSize: 24.0),
//             ),
//             Text(
//               'Enter the verification code sent to you',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             otpTextFields(context),
//             SizedBox(
//               height: 50.0,
//             ),
//             Container(
//                 margin: EdgeInsets.only(left: 60.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Didn't receive the code?",
//                       style: TextStyle(fontSize: 17.0),
//                     ),
//                     InkWell(
//                         child: Text(' RESEND',
//                             style:
//                                 TextStyle(color: Colors.blue, fontSize: 17.0))),
//                   ],
//                 )),
//             Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 width: 200.0,
//                 height: 40.0,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     PhoneAuthCredential phoneAuthCredential =
//                         PhoneAuthProvider.credential(
//                             verificationId: verificationId, smsCode: userInput);

//                     signInWithPhoneAuthCredential(phoneAuthCredential);
//                   },
//                   child: Text(
//                     'Verify',
//                     style: TextStyle(fontSize: 17.0),
//                   ),
//                   style: ElevatedButton.styleFrom(primary: Colors.green[900]),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMobileFormWidget(context),
//         child: showLoading
//           ? Center(child: CircularProgressIndicator())
//            : currentState == MobileVerficationState.SHOW_MOBILE_FORM_STATE
//                 ? getMobileFormWidget(context)
//                 : getOtpFormWidget(context)
    );
  }
}
