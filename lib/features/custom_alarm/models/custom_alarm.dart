import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/database.dart';

class CustomAlarm extends DataBase {
  final String title;
  final int studyTime;
  final int restTime;

  CustomAlarm({
    required this.title,
    required this.studyTime,
    required this.restTime,
  });

  int get sprint => studyTime + restTime;

  CustomAlarm.fromMap(DocumentSnapshot document)
      : title = document['title'] as String,
        studyTime = document['studyTime'] as int,
        restTime = document['restTime'] as int,
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'title': title,
        'studyTime': studyTime,
        'restTime': restTime,
      });
  }
}
