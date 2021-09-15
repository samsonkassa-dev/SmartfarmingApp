import 'dart:math';

import 'channel.dart';
import 'feed.dart';

int highText = 0xFFD50000;
int highTemp = 0xFFD32F2F;
int moderateText = 0xFFffC400;
int moderateTemp = 0xFFFF9800;
int normalText = 0xFF69F0AE;
int normalTemp = 0xFF66BB6A;
int lightBlueHumidity = 0xFF2196F3;
int darkBlueMoisture = 0xFF3F51B5;
List types = ["recieved", "sent"];

List coins = [];

class DataModelApi {
  late Channel channel;
  late List<Feed> feeds;

  //DataModelApi({required this.channel, required this.feeds});

  List<Object> get props => [channel, feeds];

  DataModelApi.fromJson(Map<String, dynamic> json) {
    if (json['channel'] != null) {
      channel = new Channel.fromJson(json['channel']);
    } else {
      //channel = null;
    }
    if (json['feeds'] != null) {
      feeds = [];
      json['feeds'].forEach((v) {
        feeds.add(new Feed.fromJson(v));
      });
    }
  }
}
