import 'dart:convert';

/// id : 1
/// userid : 3
/// subadminid : 2
/// title : "Pani ni Aah"
/// description : "kab tak aye ga"
/// date : "2022-10-16"
/// status : 0
/// statusdescription : "pending"
/// created_at : "2022-10-18T06:12:49.000000Z"
/// updated_at : "2022-10-18T06:12:49.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? userid, 
      int? subadminid, 
      String? title, 
      String? description, 
      String? date, 
      int? status, 
      String? statusdescription, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userid = userid;
    _subadminid = subadminid;
    _title = title;
    _description = description;
    _date = date;
    _status = status;
    _statusdescription = statusdescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userid = json['userid'];
    _subadminid = json['subadminid'];
    _title = json['title'];
    _description = json['description'];
    _date = json['date'];
    _status = json['status'];
    _statusdescription = json['statusdescription'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userid;
  int? _subadminid;
  String? _title;
  String? _description;
  String? _date;
  int? _status;
  String? _statusdescription;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? userid,
  int? subadminid,
  String? title,
  String? description,
  String? date,
  int? status,
  String? statusdescription,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userid: userid ?? _userid,
  subadminid: subadminid ?? _subadminid,
  title: title ?? _title,
  description: description ?? _description,
  date: date ?? _date,
  status: status ?? _status,
  statusdescription: statusdescription ?? _statusdescription,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get userid => _userid;
  int? get subadminid => _subadminid;
  String? get title => _title;
  String? get description => _description;
  String? get date => _date;
  int? get status => _status;
  String? get statusdescription => _statusdescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userid'] = _userid;
    map['subadminid'] = _subadminid;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['status'] = _status;
    map['statusdescription'] = _statusdescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}