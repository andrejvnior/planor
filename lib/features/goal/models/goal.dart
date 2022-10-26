import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/database.dart';

class Goal extends DataBase {
  final int? studyHours;
  final int? questions;
  final int? numberOfPages;
  final List<String>? books;

  Goal({this.studyHours, this.questions, this.numberOfPages, this.books});

  Goal.fromMap(DocumentSnapshot document)
      : studyHours = document['studyHours'] as int?,
        questions = document['questions'] as int?,
        numberOfPages = document['numberOfPages'] as int?,
        books = List.from(document['keywords']),
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'studyHours': studyHours,
        'questions': questions,
        'numberOfPages': numberOfPages,
        'books': books,
      });
  }
}
