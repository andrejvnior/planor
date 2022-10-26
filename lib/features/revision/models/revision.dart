import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/database.dart';

class Revision extends DataBase {
  final int activityType;
  final int questions;
  final int flashcards;
  final int hits;
  final int pages;
  final int duration;

  Revision({
    required this.activityType,
    required this.questions,
    required this.flashcards,
    required this.hits,
    required this.pages,
    required this.duration,
  });

  Revision.fromMap(DocumentSnapshot document)
      : activityType = document['activityType'] as int,
        questions = document['questions'] as int,
        flashcards = document['flashcards'] as int,
        hits = document['hits'] as int,
        pages = document['pages'] as int,
        duration = document['duration'] as int,
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'activityType': activityType,
        'questions': questions,
        'flashcards': flashcards,
        'hits': hits,
        'pages': pages,
        'duration': duration,
      });
  }

  double get performance => (hits * 100) / questions;
}
