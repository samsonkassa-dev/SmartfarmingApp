import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_farming/models/data_api.dart';

late DataModelApi dataModelApi;

class SensorDataProvider {
  static const url =
      "https://api.thingspeak.com/channels/1476026/fields/1.json?api_key=Y86I2FMYYUQQ7O7Z&results=2";

  Future<void> GetData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dataModelApi = DataModelApi.fromJson(jsonDecode(response.body));
      print("Successfully fetched and parsed Sensor Data");
      print(dataModelApi.feeds[1].field1);
    } else {
      print(response.body);
    }
  }
}
