import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/features/custom_alarm/models/alarm_type.dart';
import 'package:planor/models/database.dart';

class Activity extends DataBase {
  final int? studyType;
  final int? grandArea;
  final String bookId;
  final DateTime start;
  final DateTime end;
  final int alarmType;
  final String? customAlarmId;

  Activity({
    required this.studyType,
    required this.grandArea,
    required this.bookId,
    required this.start,
    required this.end,
    this.alarmType = AlarmType.stopwatch,
    this.customAlarmId,
  });

  Activity.fromMap(DocumentSnapshot document)
      : studyType = document['name'] as int,
        grandArea = document['name'] as int,
        bookId = document['name'] as String,
        start = (document['start'] as Timestamp).toDate(),
        end = (document['end'] as Timestamp).toDate(),
        alarmType = document['alarmType'] as int,
        customAlarmId = document['customAlarmId'] as String?,
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'activityType': studyType,
        'grandArea': grandArea,
        'bookId': bookId,
        'start': start,
        'end': end,
        'alarmType': alarmType,
        'customAlarmId': customAlarmId,
      });
  }

  Activity copyWith({
    int? activityType,
    int? grandArea,
    String? bookId,
    DateTime? start,
    DateTime? end,
    int? alarmType,
    String? customAlarmId,
  }) {
    return Activity(
      studyType: activityType ?? this.studyType,
      grandArea: grandArea ?? this.grandArea,
      bookId: bookId ?? this.bookId,
      start: start ?? this.start,
      end: end ?? this.end,
      alarmType: alarmType ?? this.alarmType,
      customAlarmId: customAlarmId ?? this.customAlarmId,
    );
  }
}
