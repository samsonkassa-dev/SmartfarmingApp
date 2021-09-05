class Feed {
  late String createdAt;
  late int entryId;
  late String field1;
  late String field2;
  late String field3;

  Feed(
      {required this.createdAt,
      required this.entryId,
      required this.field1,
      required this.field2,
      required this.field3});
  Feed.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    field1 = json['field1'];
    //field2 = json['field2'];
    //field3 = json['field3'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['entry_id'] = this.entryId;
    //data['field1'] = this.field1;
    //data['field2'] = this.field2;
    //data['field3'] = this.field3;
    return data;
  }
}
