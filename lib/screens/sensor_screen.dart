// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_farming/bloc/sensor_bloc.dart';
// import 'package:smart_farming/bloc/sensor_state.dart';
// import 'package:smart_farming/dataprovider/sensor_dataprovider.dart';
// import 'package:smart_farming/models/data_api.dart';

// class SensorData extends StatefulWidget {
//   @override
//   _SensorDataState createState() => _SensorDataState();
// }

// class _SensorDataState extends State<SensorData> {
//   late final DataModelApi dataModelApi;
//   late final SensorDataProvider sensorDataProvider = new SensorDataProvider();
//   @override
//   void initState() {
//     // TODO: implement initState
//     //SensorDataProvider data = new SensorDataProvider();
//     //sensorDataProvider.getData();
//     //print(dataModelApi.feeds[1].field1);
//     super.initState();
//   }

//   late String tempvalue = "";
//   late String humvalue = "";
//   void datavalue() {
//     setState(() {
//       tempvalue = dataModelApi.feeds[1].field1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sensor Data"),
//       ),
//       // body: BlocBuilder<SensorBloc, SensorState>(
//       //   builder: (_, state) {
//       //     if (state is SensorOperationFailure) {
//       //       return Center(
//       //         child: TextButton(onPressed: () {}, child: Text("Refresh")),
//       //       );
//       //     }
//       //     if (state is SensorLoadSuccess) {
//       //       return Center(
//       //         child: Text("Success"),
//       //       );
//       //       //print("Success");
//       //     }
//       //     return Center(
//       //       child: Text("Loading"),
//       //     );
//       //   },
//       // ),
//     );
//   }
// }
