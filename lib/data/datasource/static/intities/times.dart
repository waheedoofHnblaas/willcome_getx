import 'package:equatable/equatable.dart';

class Time extends Equatable {
  String? timesId;
  String? timesSenderId;
  String? users_phone;
  String? timesName;
  String? timesCreate;
  String? timesTime;
  String? timesLat;
  String? timesLong;
  String? timesLate;
  String? timesIscome;

  Time({
    required this.timesId,
    required this.users_phone,
    required this.timesSenderId,
    required this.timesName,
    required this.timesCreate,
    required this.timesTime,
    required this.timesLat,
    required this.timesLong,
    required this.timesLate,
    required this.timesIscome,
  });

  @override
  List<Object?> get props => [
        timesId,
        users_phone,
        timesSenderId,
        timesName,
        timesCreate,
        timesTime,
        timesLat,
        timesLong,
        timesLate,
        timesIscome,
      ];
}
