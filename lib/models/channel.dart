class Channel {
  late int id;
  late String name;
  late String description;
  late String latitude;
  late String longitude;
  late String field1;
  late String field2;
  late String field3;
  late String createdAt;
  late String updatedAt;
  late int lastEntryId;

  Channel(
      {required this.id,
      required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.field1,
      required this.field2,
      required this.field3,
      required this.createdAt,
      required this.updatedAt,
      required this.lastEntryId});

  Channel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    //description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    field1 = json['field1'];
    field2 = json['field2'];
    //field3 = json['field3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastEntryId = json['last_entry_id'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['field1'] = this.field1;
    data['field2'] = this.field2;
    data['field3'] = this.field3;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_entry_id'] = this.lastEntryId;
    return data;
  }
}
