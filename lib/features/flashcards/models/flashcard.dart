import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/database.dart';

class FlashCard extends DataBase {
  final String title;
  final int grandArea;
  final String bookId;
  final String question;
  final String answer;

  FlashCard({
    required this.title,
    required this.grandArea,
    required this.bookId,
    required this.question,
    required this.answer,
  });

  FlashCard.fromMap(DocumentSnapshot document)
      : title = document['title'] as String,
        grandArea = document['grandArea'] as int,
        bookId = document['bookId'] as String,
        question = document['question'] as String,
        answer = document['answer'] as String,
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'name': title,
        'grandArea': grandArea,
        'bookId': bookId,
        'question': question,
        'answer': answer,
      });
  }
}
