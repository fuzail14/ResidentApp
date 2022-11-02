class Event {
  List<Data>? data;

  Event({this.data});

  Event.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userid;
  int? roleid;
  String? rolename;
  String? title;
  String? description;
  String? startdate;
  String? enddate;
  int? active;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userid,
        this.roleid,
        this.rolename,
        this.title,
        this.description,
        this.startdate,
        this.enddate,
        this.active,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    title = json['title'];
    description = json['description'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['roleid'] = this.roleid;
    data['rolename'] = this.rolename;
    data['title'] = this.title;
    data['description'] = this.description;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
