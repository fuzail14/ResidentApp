import 'package:flutter/material.dart';

class NoticeBoardModel {
  final int? id;
  final String? noticetitle;

  final String? noticedetail;
  final String? startdate;
  final String? enddate;
  final String? starttime;
  final String? endtime;
  final int? status;
  final int? subadminid;
  NoticeBoardModel(
      {this.id,
      this.noticetitle,
      this.noticedetail,
      this.startdate,
      this.enddate,
      this.starttime,
      this.endtime,
      this.status,
      this.subadminid});


      
}
