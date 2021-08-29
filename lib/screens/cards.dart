// import 'package:flutter/material.dart';
// import 'package:weather_icons/weather_icons.dart';

// class Cards extends StatefulWidget {
//   @override
//   _CardsState createState() => _CardsState();
// }

// class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//           children: [ Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10)
//                 ),
//                 ),
//                 child: Column(children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                       Row(
//                         children: [
//                         Icon(
//                           WeatherIcons.thermometer,
//                           color: Colors.red[900],
//                           size: 35.0,
//                         ),
//                         SizedBox(
//                           width: 10
//                         ),
//                         Text(
//                           'Temperature',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                       ),
//                       Text(
//                         'Indicator',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blue[400],
//                         ),
//                       ),
//                     ],
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 150,
//                     child: Text(
//                       '29',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 100,
//                         fontWeight: FontWeight.w200,
//                       ),
//                     ),
//                   )
//                 ],
//                 ),
//                 ),
//                 Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10)
//                 ),
//                 ),
//                 child: Column(children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                       Row(
//                         children: [
//                         Icon(
//                           WeatherIcons.humidity,
//                           color: Colors.blue[900],
//                           size: 35.0,
//                         ),
//                         SizedBox(
//                           width: 10
//                         ),
//                         Text(
//                           'Humidity',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                       ),
//                       Text(
//                         'Indicator',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blue[400],
//                         ),
//                       ),
//                     ],
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 150,
//                     child: Text(
//                       '56',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 100,
//                         fontWeight: FontWeight.w200,
//                       ),
//                     ),
//                   )
//                 ],
//                 ),
//                 ),
//                 Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10)
//                 ),
//                 ),
//                 child: Column(children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                       Row(
//                         children: [
//                         Icon(
//                           WeatherIcons.raindrops,
//                           color: Colors.blue,
//                           size: 55.0,
//                         ),
//                         SizedBox(
//                           width: 10
//                         ),
//                         Text(
//                           'Moisture',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                       ),
//                       Text(
//                         'Indicator',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blue[400],
//                         ),
//                       ),
//                     ],
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 150,
//                     child: Text(
//                       '09',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.blue[200],
//                         fontSize: 100,
//                         fontWeight: FontWeight.w200,
//                       ),
//                     ),
//                   )
//                 ],
//                 ),
//                 ),
//           ]
//     );
//   }
// }

// // class Dashboard extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Smart Farming'),
// //           backgroundColor: Colors.green[900],
// //         ),
// //         body: Container(
// //             margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
// //             child: ListView(children: [
// //               Card
// //             ])));
// //   }
// // }
// //               Card(
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.all(Radius.circular(10))),
// //                   elevation: 5.0,
// //                   child: Column(children: [
// //                     Padding(
// //                       padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
// //                       child: Row(
// //                         mainAxisSize: MainAxisSize.max,
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Row(
// //                             children: [
// //                               Icon(
// //                                 Icons.thermostat,
// //                                 color: Color(0xffd40000),
// //                                 size: 35.0,
// //                               ),
// //                               SizedBox(
// //                                 width: 10,
// //                               ),
// //                               Text(
// //                                 'Temperature',
// //                                 style: TextStyle(fontSize: 20),
// //                               ),
// //                             ],
// //                           ),
// //                           Text(
// //                             'critical',
// //                             style: TextStyle(
// //                                 fontSize: 12.0, color: Color(0xffd40000)),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Container(
// //                         width: 250,
// //                         height: 150,
// //                         child: Text(
// //                           '29',
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(
// //                             color: Color(0xffd40000),
// //                             fontSize: 100,
// //                             fontWeight: FontWeight.w200,
// //                           ),
// //                         )),
// //                     Card(
// //                       shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.all(Radius.circular(10))),
// //                       elevation: 5.0,
// //                       child: Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
// //                             child: Row(
// //                               mainAxisSize: MainAxisSize.max,
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Row(
// //                                   children: [
// //                                     Icon(
// //                                       WeatherIcons.humidity,
// //                                       color: Color(0xff0466c8),
// //                                       size: 35.0,
// //                                     ),
// //                                     SizedBox(
// //                                       width: 10,
// //                                     ),
// //                                     Text(
// //                                       'Humidity',
// //                                       style: TextStyle(fontSize: 20),
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 Text(
// //                                   'All good',
// //                                   style: TextStyle(
// //                                       fontSize: 12.0, color: Color(0xff0466c8)),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                               // width: MediaQuery.of(context).size.width,
// //                               height: 150,
// //                               child: Text(
// //                                 '55',
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(
// //                                   color: Colors.blue[300],
// //                                   fontSize: 100,
// //                                   fontWeight: FontWeight.w200,
// //                                 ),
// //                               )),
// //                         ],
// //                       ),
// //                     ),
// //                     Card(
// //                       shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.all(Radius.circular(10))),
// //                       elevation: 5.0,
// //                       child: Column(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
// //                             child: Row(
// //                               mainAxisSize: MainAxisSize.max,
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Row(
// //                                   children: [
// //                                     Icon(
// //                                       WeatherIcons.raindrops,
// //                                       color: Colors.blue,
// //                                       size: 55.0,
// //                                     ),
// //                                     SizedBox(
// //                                       width: 10,
// //                                     ),
// //                                     Text(
// //                                       'Moisture',
// //                                       style: TextStyle(fontSize: 20),
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 Text(
// //                                   'Low Soil Moisture',
// //                                   style: TextStyle(
// //                                       fontSize: 12.0, color: Colors.blue),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Container(
// //                               // width: MediaQuery.of(context).size.width,
// //                               height: 150,
// //                               child: Text(
// //                                 '09',
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(
// //                                   color: Color(0xffd40000),
// //                                   fontSize: 100,
// //                                   fontWeight: FontWeight.w200,
// //                                 ),
// //                               )),
// //                         ],
// //                       ),
// //                     )
// //                   ]))
// //             ])));
// //   }
// // }

// // //     child: Row(
// // //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //       children: [
// // //         Icon(
// // //           WeatherIcons.humidity,
// // //           color: Color(0xff0466c8),
// // //           size: 40.0,
// // //         ),
// // //         Text(
// // //           'Humidity',
// // //           style: TextStyle(fontSize: 24.0),
// // //         )
// // //       ],
// // //     ),
// // //   ),
// // // ),
// // // SizedBox(
// // //   height: 200.0,
// // //     child: Card(
// // //     elevation: 5.0,
// // //     child: Row(
// // //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //       children: [
// // //         Icon(
// // //           WeatherIcons.raindrop,
// // //           color: Colors.blue,
// // //           size: 40.0,
// // //         ),
// // //         Text(
// // //           'Moisture',
// // //           style: TextStyle(fontSize: 24.0),
// // //         )
// // //       ],
// // //     ),
