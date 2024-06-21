class TestModel {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;

  TestModel(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersCreate});

  TestModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'].toString();
    usersName = json['users_name'];
    usersPassword = json['users_password'].toString();
    usersEmail = json['users_email'].toString();
    usersPhone = json['users_phone'].toString();
    usersVerfiycode = json['users_verfiycode'].toString();
    usersApprove = json['users_approve'].toString();
    usersCreate = json['users_create'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_password'] = usersPassword;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_verfiycode'] = usersVerfiycode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    return data;
  }
}
