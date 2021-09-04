// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_farming/bloc/sensor_event.dart';
// import 'package:smart_farming/bloc/sensor_state.dart';
// import 'package:smart_farming/repository/sensor_repository.dart';
//
// class SensorBloc extends Bloc<SensorEvent, SensorState> {
//   final SensorRepository sensorRepository;
//   SensorBloc({required this.sensorRepository}) : super(SensorLoading());
//   @override
//   Stream<SensorState> mapEventToState(SensorEvent event) async* {
//     // TODO: implement mapEventToState
//
//     if (event is SensorLoad) {
//       yield SensorLoading();
//       try {
//         final data = await sensorRepository.getData();
//         yield SensorLoadSuccess(data);
//       } catch (_) {
//         yield SensorOperationFailure();
//       }
//       //throw UnimplementedError();
//     }
//   }
// }
