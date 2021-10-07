class Channels {
  //late int id;
  late String name;
  late String description;
  late String latitude;
  late String longitude;
  late List field1;
  late String v;
  late List field2;
  late List field3;
  //late String createdAt;
  //late String updatedAt;
  //late int lastEntryId;

  Channels({
    //required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    //required this.field1,
    //required this.field2,
    //required this.field3,
    //required this.createdAt,
    //required this.updatedAt,
    //required this.lastEntryId
  });

  Channels.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    name = json['name'];
    //description = json['description'];
    //latitude = json['latitude'];
    //longitude = json['longitude'];
    field1 = json['field1'];

    field2 = json['field2'];
    field3 = json['field3'];
    //createdAt = json['created_at'];
    //updatedAt = json['updated_at'];
    //lastEntryId = json['last_entry_id'];
  }
}
