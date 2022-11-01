class UserModeModel {
  String? usersId;
  String? usersName;
  String? willcome;

  UserModeModel({this.usersId, this.willcome});

  UserModeModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    willcome = json['willcome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['willcome'] = this.willcome;
    return data;
  }
}