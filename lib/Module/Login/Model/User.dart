class User {
  final int? userid;
  final String? firstName;
  final String? lastName;
  final String? cnic;
  final int? roleId;
  final int? subadminid;
  final String? roleName;
  final String? bearerToken;

  User(
      {this.userid,
      this.subadminid,
      this.firstName,
      this.lastName,
      this.cnic,
      this.roleId,
      this.roleName,
      this.bearerToken});
}
