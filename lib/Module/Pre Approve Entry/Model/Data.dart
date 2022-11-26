import 'dart:convert';

/// id : 15
/// gatekeeperid : 8
/// userid : 3
/// visitortype : "Guest"
/// name : "karachi"
/// description : "haha"
/// cnic : "yaha"
/// mobileno : "hahah"
/// vechileno : "yayaya"
/// arrivaldate : "2022-11-01"
/// arrivaltime : "11:50:00"
/// status : 1
/// statusdescription : "Approved"
/// created_at : "2022-11-01T06:50:05.000000Z"
/// updated_at : "2022-11-01T14:10:56.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? gatekeeperid, 
      int? userid, 
      String? visitortype, 
      String? name, 
      String? description, 
      String? cnic, 
      String? mobileno, 
      String? vechileno, 
      String? arrivaldate, 
      String? arrivaltime, 
      int? status, 
      String? statusdescription, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _gatekeeperid = gatekeeperid;
    _userid = userid;
    _visitortype = visitortype;
    _name = name;
    _description = description;
    _cnic = cnic;
    _mobileno = mobileno;
    _vechileno = vechileno;
    _arrivaldate = arrivaldate;
    _arrivaltime = arrivaltime;
    _status = status;
    _statusdescription = statusdescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _gatekeeperid = json['gatekeeperid'];
    _userid = json['userid'];
    _visitortype = json['visitortype'];
    _name = json['name'];
    _description = json['description'];
    _cnic = json['cnic'];
    _mobileno = json['mobileno'];
    _vechileno = json['vechileno'];
    _arrivaldate = json['arrivaldate'];
    _arrivaltime = json['arrivaltime'];
    _status = json['status'];
    _statusdescription = json['statusdescription'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _gatekeeperid;
  int? _userid;
  String? _visitortype;
  String? _name;
  String? _description;
  String? _cnic;
  String? _mobileno;
  String? _vechileno;
  String? _arrivaldate;
  String? _arrivaltime;
  int? _status;
  String? _statusdescription;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? gatekeeperid,
  int? userid,
  String? visitortype,
  String? name,
  String? description,
  String? cnic,
  String? mobileno,
  String? vechileno,
  String? arrivaldate,
  String? arrivaltime,
  int? status,
  String? statusdescription,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  gatekeeperid: gatekeeperid ?? _gatekeeperid,
  userid: userid ?? _userid,
  visitortype: visitortype ?? _visitortype,
  name: name ?? _name,
  description: description ?? _description,
  cnic: cnic ?? _cnic,
  mobileno: mobileno ?? _mobileno,
  vechileno: vechileno ?? _vechileno,
  arrivaldate: arrivaldate ?? _arrivaldate,
  arrivaltime: arrivaltime ?? _arrivaltime,
  status: status ?? _status,
  statusdescription: statusdescription ?? _statusdescription,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get gatekeeperid => _gatekeeperid;
  int? get userid => _userid;
  String? get visitortype => _visitortype;
  String? get name => _name;
  String? get description => _description;
  String? get cnic => _cnic;
  String? get mobileno => _mobileno;
  String? get vechileno => _vechileno;
  String? get arrivaldate => _arrivaldate;
  String? get arrivaltime => _arrivaltime;
  int? get status => _status;
  String? get statusdescription => _statusdescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gatekeeperid'] = _gatekeeperid;
    map['userid'] = _userid;
    map['visitortype'] = _visitortype;
    map['name'] = _name;
    map['description'] = _description;
    map['cnic'] = _cnic;
    map['mobileno'] = _mobileno;
    map['vechileno'] = _vechileno;
    map['arrivaldate'] = _arrivaldate;
    map['arrivaltime'] = _arrivaltime;
    map['status'] = _status;
    map['statusdescription'] = _statusdescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}