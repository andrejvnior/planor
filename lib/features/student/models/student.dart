import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planor/models/user.dart';

class Student extends User {
  final String? university;
  final DateTime? graduationYear;
  final bool isActive;

  Student({
    this.university,
    this.graduationYear,
    this.isActive = true,
    required name,
    required lastName,
    required birthday,
    required gender,
    required country,
    required city,
    required state,
  }) : super(
          name: name,
          lastName: lastName,
          birthday: birthday,
          gender: gender,
          country: country,
          city: city,
          state: state,
        );

  Student.fromMap(DocumentSnapshot document)
      : university = document['university'] as String,
        graduationYear = (document['graduationYear'] as Timestamp).toDate(),
        isActive = document['isActive'],
        super.fromMap(document);

  @override
  Map<String, dynamic> toMap() {
    return super.toMap()
      ..addAll({
        'university': university,
        'graduationYear': graduationYear,
        'isActive': isActive,
      });
  }
}
