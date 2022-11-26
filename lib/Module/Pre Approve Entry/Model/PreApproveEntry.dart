import 'Data.dart';
import 'dart:convert';

/// success : true
/// data : [{"id":15,"gatekeeperid":8,"userid":3,"visitortype":"Guest","name":"karachi","description":"haha","cnic":"yaha","mobileno":"hahah","vechileno":"yayaya","arrivaldate":"2022-11-01","arrivaltime":"11:50:00","status":1,"statusdescription":"Approved","created_at":"2022-11-01T06:50:05.000000Z","updated_at":"2022-11-01T14:10:56.000000Z"},{"id":14,"gatekeeperid":8,"userid":3,"visitortype":"Guest","name":"bwjw","description":"hwyw","cnic":"yquq","mobileno":"hqhqu","vechileno":"qyyq","arrivaldate":"2022-11-01","arrivaltime":"05:30:00","status":0,"statusdescription":"unapproved","created_at":"2022-11-01T06:30:44.000000Z","updated_at":"2022-11-01T06:30:44.000000Z"},{"id":13,"gatekeeperid":8,"userid":3,"visitortype":"Delivery","name":"bbb","description":"yy","cnic":"hh","mobileno":"hhh","vechileno":"gg","arrivaldate":"2022-11-01","arrivaltime":"03:41:00","status":0,"statusdescription":"unapproved","created_at":"2022-11-01T05:41:38.000000Z","updated_at":"2022-11-01T05:41:38.000000Z"},{"id":12,"gatekeeperid":8,"userid":3,"visitortype":"Delivery","name":"iqrar","description":"","cnic":"","mobileno":"03283884","vechileno":"22882","arrivaldate":"2022-11-01","arrivaltime":"10:38:00","status":0,"statusdescription":"unapproved","created_at":"2022-11-01T05:38:10.000000Z","updated_at":"2022-11-01T05:38:10.000000Z"},{"id":11,"gatekeeperid":8,"userid":3,"visitortype":"Cab","name":"waqae","description":"","cnic":"","mobileno":"03219990979","vechileno":"rwpnenw","arrivaldate":"2022-11-01","arrivaltime":"04:36:00","status":0,"statusdescription":"unapproved","created_at":"2022-11-01T05:37:28.000000Z","updated_at":"2022-11-01T05:37:28.000000Z"},{"id":10,"gatekeeperid":8,"userid":3,"visitortype":"Delivery","name":"zinger","description":"burger","cnic":"032155079","mobileno":"030082","vechileno":"rwp 228","arrivaldate":"2022-11-01","arrivaltime":"10:28:00","status":0,"statusdescription":"unapproved","created_at":"2022-11-01T05:28:35.000000Z","updated_at":"2022-11-01T05:28:35.000000Z"},{"id":9,"gatekeeperid":8,"userid":3,"visitortype":"Cab","name":"hh","description":"tt","cnic":"tt","mobileno":"ttt","vechileno":"tt","arrivaldate":"2022-10-31","arrivaltime":"17:44:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-31T12:44:32.000000Z","updated_at":"2022-10-31T12:44:32.000000Z"},{"id":8,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":1,"statusdescription":"approved","created_at":"2022-10-31T11:57:23.000000Z","updated_at":"2022-10-31T11:57:23.000000Z"},{"id":7,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:30:32.000000Z","updated_at":"2022-10-30T17:30:32.000000Z"},{"id":6,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:30:06.000000Z","updated_at":"2022-10-30T17:30:06.000000Z"},{"id":5,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:29:54.000000Z","updated_at":"2022-10-30T17:29:54.000000Z"},{"id":4,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:29:50.000000Z","updated_at":"2022-10-30T17:29:50.000000Z"},{"id":3,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:25:11.000000Z","updated_at":"2022-10-30T17:25:11.000000Z"},{"id":2,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:24:45.000000Z","updated_at":"2022-10-30T17:24:45.000000Z"},{"id":1,"gatekeeperid":7,"userid":3,"visitortype":"guest","name":"hadi abrar","description":"this is my first entry","cnic":"37805","mobileno":"03215550979","vechileno":"rwp 2005","arrivaldate":"2022-10-30","arrivaltime":"04:00:00","status":0,"statusdescription":"unapproved","created_at":"2022-10-30T17:18:54.000000Z","updated_at":"2022-10-30T17:18:54.000000Z"}]

PreApproveEntry preApproveEntryFromJson(String str) => PreApproveEntry.fromJson(json.decode(str));
String preApproveEntryToJson(PreApproveEntry data) => json.encode(data.toJson());
class PreApproveEntry {
  PreApproveEntry({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  PreApproveEntry.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
PreApproveEntry copyWith({  bool? success,
  List<Data>? data,
}) => PreApproveEntry(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}