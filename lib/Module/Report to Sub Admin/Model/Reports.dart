import 'Data.dart';
import 'dart:convert';

/// success : true
/// data : [{"id":1,"userid":3,"subadminid":2,"title":"Pani ni Aah","description":"kab tak aye ga","date":"2022-10-16","status":0,"statusdescription":"pending","created_at":"2022-10-18T06:12:49.000000Z","updated_at":"2022-10-18T06:12:49.000000Z"},{"id":2,"userid":3,"subadminid":2,"title":"Pani ni Aah","description":"kab tak aye ga","date":"2022-10-16","status":0,"statusdescription":"pending","created_at":"2022-10-18T06:13:17.000000Z","updated_at":"2022-10-18T06:13:17.000000Z"},{"id":3,"userid":3,"subadminid":2,"title":"wu2u","description":"hhh","date":"2022-10-29","status":0,"statusdescription":"pending","created_at":"2022-10-18T07:20:48.000000Z","updated_at":"2022-10-18T07:20:48.000000Z"}]

Reports reportsFromJson(String str) => Reports.fromJson(json.decode(str));
String reportsToJson(Reports data) => json.encode(data.toJson());
class Reports {
  Reports({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  Reports.fromJson(dynamic json) {
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
Reports copyWith({  bool? success,
  List<Data>? data,
}) => Reports(  success: success ?? _success,
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