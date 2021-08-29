import 'dart:math';

import 'channel.dart';
import 'feed.dart';

class DataModelApi {
  late Channel channel;
  late List<Feed> feeds;

  DataModelApi({required this.channel, required this.feeds});

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
