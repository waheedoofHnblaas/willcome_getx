import 'package:willcome_getx/data/datasource/static/intities/times.dart';

class TimeModel extends Time {
  TimeModel({
    required super.timesId,
    required super.users_phone,
    required super.timesSenderId,
    required super.timesName,
    required super.timesCreate,
    required super.timesTime,
    required super.timesLat,
    required super.timesLong,
    required super.timesLate,
    required super.timesIscome,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      timesId: json['times_id'],
      users_phone: json['users_phone'],
      timesSenderId: json['times_senderId'],
      timesName: json['times_name'],
      timesCreate: json['times_create'],
      timesTime: json['times_time'],
      timesLat: json['times_lat'],
      timesLong: json['times_long'],
      timesLate: json['times_late'],
      timesIscome: json['times_iscome'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['times_id'] = timesId;
    data['users_phone'] = users_phone;
    data['times_senderId'] = timesSenderId;
    data['times_name'] = timesName;
    data['times_create'] = timesCreate;
    data['times_time'] = timesTime;
    data['times_lat'] = timesLat;
    data['times_long'] = timesLong;
    data['times_late'] = timesLate;
    data['times_iscome'] = timesIscome;
    return data;
  }
}
