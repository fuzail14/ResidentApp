class AdminReportHistory {
 int? id;
  
  int? userid;
  int? subadminid;
  String? title;
  String? description;
  String? date;
  int? status;
  String? statusdescription;
  String? created_at;
  String? updated_at;
  AdminReportHistory(
      {required this.id,
      
      required this.userid,
      required this.subadminid,
      required this.title,
      required this.description,
      required this.date,
      required this.status,
      required this.statusdescription,
      required this.created_at,
      required this.updated_at,
      
      });
}
